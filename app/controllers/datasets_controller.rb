require 'net/http'
require 'digest/md5'
require 'table_factory.rb'
require 'analyze_function.rb'
require 'sample_analyzer'

class DatasetsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @dataset = Dataset.new
  end

  def create

    #Bind dataset variable with values from form data
    @dataset = current_user.datasets.build(dataset_params)

    #Select dataset from database by origin_uri
    dataset_already_exists = Dataset.where(originuri: @dataset.link).length > 0


    #if !dataset_already_exists
      #Dataset does not already exists

      begin
        #Prepare enviroment variables
        origin_uri = URI(@dataset.link)
        target_file = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
        target_extension = File.extname(origin_uri.path)
        target_uri = Settings.dataset_target_path + target_file + target_extension

        if(! origin_uri.host)
          raise TypeError, "Wrong URL"
        end

        #Download dataset from given url
        Net::HTTP.start(origin_uri.host, origin_uri.port) do |http|
          request = Net::HTTP::Get.new origin_uri

          http.request request do |response|
            #We need to open file for binary write
            File.open(target_uri, "wb+") do |f|
              response.read_body do |chunk|
                f.write(chunk)
              end
            end
          end
        end

        #Create datasets hash
        dataset_hash = Digest::MD5.hexdigest(File.read(target_uri))

        @dataset.filehash = dataset_hash
        @dataset.storage = target_uri
        @dataset.downloadstatus = 1
        @dataset.originuri = @dataset.link

        if @dataset.save
          TableFactory.new.builder(@dataset)

          flash[:success] = 'Dataset successfully downloaded :) ' + @dataset.link + " " + dataset_already_exists.to_s
          render 'new'
        else
          flash[:failure] = 'Dataset download failed :( ' + @dataset.link
          render 'new'
        end



      rescue TypeError => e
        flash[:fail] = 'URL: "' + @dataset.link + '" you provided seems to be invalid :( '
        logger.warn 'URL seems to be invalid : ' + @dataset.link
        render 'new'
      rescue SocketError => r
        flash[:fail] = 'Cannot connect to server: ' + @dataset.link
        logger.warn 'Cannot connect to server: ' + @dataset.link
        render 'new'
      end
    # else
    #   #Dataset already exists
    #   existing_dataset = Dataset.where(originuri: @dataset.link)[0]
    #   # TODO We need to create new mapping table dataset:user
    #
    #   flash[:success] = 'Dataset has not been downloaded, already exists :) '
    #   redirect_to root_path
    # end
  end

  def update
    @dataset = Dataset.find(params[:id])
    if @dataset.update(dataset_params)
      redirect_to datasets_path
    else
      render 'edit'
    end
  end
  def index
    # @dataset = Dataset.find(params[:id])
    @Datasets = Dataset.where.not(status: 'N').where(user_id: current_user.id, deleted: false).first(10)
    @AnalyzedDatasets = Dataset.where(user_id: current_user.id, deleted: false, analyzed_progress: 0).first(10)

    @Types = { }
    @Datasets.each do |dataset|
      @Types[dataset.id] = []
      @Dataset  = Dataset.find(dataset.id)
      header    = dataset.headers.all
      columns   = header.first.columns.all.order(:id)

      columns.each do |column|
        if !column.type_id.blank?
          @Types[dataset.id] << Type.find(column.type_id).name
        end
      end
    end
  end

  def edit
    @dataset = Dataset.find(params[:id])
  end

  def destroy
    @dataset = Dataset.find(params[:id])
    if @dataset.update(deleted: true)
      redirect_to datasets_path
    else
      render 'edit'
    end
  end

  def show
    @dataset = Dataset.find(params[:id])
    @headers = @dataset.headers.all
    @columns = @headers.first.columns.all.order(:id)
    @coordinates = Coordinate.all
    @types = Type.all

    name_of_dataset_data_table = @dataset.data_table_name
    @data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }

    @number_of_data_rows = @data.count
    if @number_of_data_rows > 15
      @number_of_data_rows = 15
    end

    @names_of_data_columns = @data.column_names

    #data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }
    #data=data.order('"'+"Mesto / Obec"+'"')
    #@yData =data.pluck("Výška pohľadávky")[0..10].collect{|i| i.to_f}
    #@xData =data.pluck("Mesto / Obec")[0..10]
    if params[:xData].nil?
      @xData = Array.[](1991,1992,1993,1994,1995)
      @yData = Array.[](20,74,5,101,36)
    else
      @xData=params[:xData]
      @yData=params[:yData].collect{|i| i.to_f}
    end
  end

  def change_type
    @dataset = Dataset.find(params[:id])
    name_of_dataset_data_table = @dataset.data_table_name
    @data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }

    column_to_change_type = @dataset.headers.first.columns.find(params[:column_id])
    column_to_change_type.type_id = params[:type_id]
    column_to_change_type.save

    if params[:type_id] == '5'
      for i in 1..@data.count do
        name_of_town = @data.find(i)[Column.find(params[:column_id]).label]
        if Coordinate.find_by_mesto(name_of_town).nil?
          sleep(0.25) #kvoli prekroceniu limitu za sekundu requestov na google
          coordinates = Geocoder.coordinates(name_of_town)
          coordinate_to_save = Coordinate.new
          coordinate_to_save.lat=coordinates[0]
          coordinate_to_save.lng=coordinates[1]
          coordinate_to_save.mesto=name_of_town
          coordinate_to_save.save
        end
      end
    end

    flash[:success] = 'Changes saved!'
    redirect_to :back
  end


  def start_analyze
    @dataset = Dataset.find(params[:id])

    @dataset.status = 'A'
    if @dataset.save
      flash[:success] = 'Wohoho the analysis has started!'
    end


    sa = SampleAnalyzer.new
    sa.delay.analyze(@dataset)
    
    redirect_to :back
  end

  def change_X_Y

    dataset = Dataset.find(params[:id])
    @columnX=dataset.headers.first.columns.find(params[:column_x]).label
    @columnY=dataset.headers.first.columns.find(params[:column_y]).label


    name_of_dataset_data_table = dataset.data_table_name
    data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }


    data=data.order('"'+@columnX.to_s+'"')
    @yData =data.pluck(@columnY.to_s)[0..20].collect{|i| i.gsub(/\s/, '').to_f}
    @xData =data.pluck(@columnX.to_s)[0..20]


    puts 'Toto je stlpec'
    puts @yData.inspect
    puts @xData.inspect
    flash[:success] = 'values changed !'
    redirect_to :controller => 'datasets', :action => 'show',:id => params[:id], :xData => @xData,:yData => @yData
  end


  private
  def dataset_params
    params.require(:dataset).permit(:name, :description, :link)
  end
end

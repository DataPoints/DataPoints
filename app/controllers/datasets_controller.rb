require 'net/http'
require 'digest/md5'
require 'table_factory.rb'
require 'analyze_function.rb'
require 'sample_analyzer'

class DatasetsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, except: [:index, :new, :create]

  def new
    @dataset = Dataset.new
  end

  def create
    #Bind dataset variable with values from form data
    @dataset = current_user.datasets.build(dataset_params)
    @dataset.status = 'S'
    @dataset.save

    WorkFlow.new.delay.start(@dataset, params[:send_mail])
    flash[:info] = 'Dataset is processing...'
    redirect_to datasets_path
  end

  def update
    @dataset = Dataset.find(params[:id])
    if @dataset.update_attributes(dataset_params)
      flash[:success] = 'Dataset changed successfully'
      redirect_to datasets_path
    else
      flash[:danger] = 'There was an error.'
      redirect_to datasets_path
    end
  end

  def index
    # @dataset = Dataset.find(params[:id])
    @Datasets = Dataset.where(user_id: current_user.id, deleted: false).page(params[:page]).per(25)

    @Types = { }
    @Datasets.each do |dataset|
      @Types[dataset.id] = []
      if dataset.status == 'P' || dataset.status == 'A'
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
  end

  def edit
    @dataset = Dataset.find(params[:id])
  end

  def destroy
    @dataset = Dataset.find(params[:id])
    if @dataset.update(deleted: true)
      flash[:success] = 'Dataset was deleted.'
      redirect_to :back
    else
      flash[:danger] = 'Dataset deletion failed.'
      redirect_to :back
    end
  end

  def show
    @dataset = Dataset.find(params[:id])
    @headers = @dataset.headers.all
    @columns = @headers.first.columns.all.order(:id)
    @coordinates = @dataset.coordinates
    @types = Type.all
    @summaries = Summary.all

    name_of_dataset_data_table = @dataset.data_table_name
    @data = Class.new(ActiveRecord::Base){self.table_name = name_of_dataset_data_table }
    @data = @data.page(params[:page]).per(25)

    @number_of_data_rows = @data.count
    # if @number_of_data_rows > 15
    #   @number_of_data_rows = 15
    # end

    @names_of_data_columns = @data.column_names

    #data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }
    #data=data.order('"'+"Mesto / Obec"+'"')
    #@yData =data.pluck("Výška pohľadávky")[0..10].collect{|i| i.to_f}
    #@xData =data.pluck("Mesto / Obec")[0..10]

    #get all numeric columns
    numericTypeID = Type.find_by_name("Number").id
    @numericColumns = Array.new
    @nonNumericColumns = Array.new
    @columns.each do |column|
      if(column.type_id == numericTypeID)
        @numericColumns.push(column.label)
      else
        @nonNumericColumns.push(column.label)
      end
    end

    if params[:xData].nil?
      @xData = Array.new
      @yData = Array.new

      #draw first non-numeric vs first numeric columns into chart
      @data.each do |row|
        @xData.push(row[@nonNumericColumns[0]])
        @yData.push(row[@numericColumns[0]].to_f)
      end
      @xType = @nonNumericColumns[0]
      @yType = @numericColumns[0]
    else
      @xData = params[:xData]
      @yData = params[:yData].collect{|i| i.to_f}
      @xType = params[:xType]
      @yType = params[:yType]
    end

    if params[:hData].nil? && @hData.nil?
      @hData = "['Shanghai', 23.7],
                    ['Lagos', 16.1],
                    ['Instanbul', 14.2]"
    else
      @hData=params[:hData]
    end

    #get next numeric column
    if(@numericColumns.include? @yType)
      @nextNumericColumn = @numericColumns.index(@yType)+1
      if(@nextNumericColumn >= @numericColumns.count)
        @nextNumericColumn = 0
      end
    else
      @nextNumericColumn = 0
    end

    @nextNumericColumn = @numericColumns[@nextNumericColumn]
    @nextNumericColumn = @columns.find_by_label(@nextNumericColumn).id

    #get actual x column
    @actualXColumn = @columns.find_by_label(@xType).id
  end

  def change_type
    @dataset = Dataset.find(params[:id])

    column_to_change_type = @dataset.headers.first.columns.find(params[:column_id])
    column_to_change_type.type_id = params[:type_id]
    column_to_change_type.analyze = true
    column_to_change_type.save

    redirect_to dataset_path(@dataset, :anchor => 'type')
  end


  def start_analyze
    @dataset = Dataset.find(params[:id])


    # Toto destroyAll nie je uplne idealne, lepsie by bolo ukladat ku kazdemu zmenemu stlpcu
    # aj to ze z coho bol zmeneny. Inak sa to neda, analyze priznak je nafigu, lebo je syntetizovany
    # z rozdielu previousType, currentType :)
    @dataset.coordinates.destroy_all
    coordinateColumns = @dataset.headers.first.columns.where(type_id: 5)
    coordinateColumns.each do |column|
      AnalyzeFunction.new.delay.count_lat_long(@dataset,column)
    end


    changed_columns=@dataset.headers.first.columns.where(analyze: true)
    changed_columns.each do |col|
      if (col.analyze == true)
        if(col.type_id==4)
          AnalyzeFunction.new.delay.r_analyze_dataset_user(@dataset,col)
          col.analyze = false
          col.save
        end
      end
    end

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


    puts 'This is column'
    puts @yData.inspect
    puts @xData.inspect
    redirect_to :controller => 'datasets', :action => 'show',:id => params[:id], :xType => @columnX, :yType => @columnY, :xData => @xData,:yData => @yData, :anchor => 'change'
  end

  def change_H

    dataset = Dataset.find(params[:id])
    @columnH=dataset.headers.first.columns.find(params[:column_h]).label

    name_of_dataset_data_table = dataset.data_table_name
    data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }

    data=data.order('"'+@columnH.to_s+'"')

    hString = ""

    hDataraw = data.pluck(@columnH.to_s)
    if (hDataraw.length() != hDataraw.uniq.length())
      hDataraw =  Hash[*hDataraw.group_by{ |v| v }.flat_map{ |k, v| [k, v.size] }]
      hDataraw = hDataraw.sort_by {|k,v| v}.reverse

      poslednyZaznam = 0
      hDataraw.each do |key, array|
        poslednyZaznam = poslednyZaznam + 1
        hString = hString + "['#{key}',#{array}]"

        if (poslednyZaznam != 10)
          hString = hString + ","
        else
          break
        end

      end

      @hData = hString
      puts hString
      puts 'Toto je stlpec'
      puts @hData.inspect

      redirect_to :controller => 'datasets', :action => 'show',:id => params[:id], :hData => @hData, :anchor => 'change'
    else
      flash[:danger] = 'Each value in selected column is uniq.'
      redirect_to :back
    end
  end

  def correct_user
    dataset = Dataset.find(params[:id])
    if dataset.user != current_user
      flash[:danger] = 'Permission denied.'
      redirect_to root_path
    end
  end

  private
  def dataset_params
    params.require(:dataset).permit(:name, :description, :link)
  end
end

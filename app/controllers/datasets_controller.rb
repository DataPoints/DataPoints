require 'net/http'
require 'digest/md5'
require 'table_factory.rb'
require 'analyze_function.rb'
require 'sample_analyzer'

class DatasetsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, except: [:index, :new, :create]
  before_action :analyzing?, only: [:show]

  def new
    @dataset = Dataset.new
  end

  def create
    #Bind dataset variable with values from form data
    @dataset = current_user.datasets.build(dataset_params)
    if @dataset.valid?

      @dataset.status = 'S'
      @dataset.save

      WorkFlow.new.delay.start(@dataset, params[:send_mail])
      flash[:info] = 'Dataset is processing...'
      redirect_to datasets_path
    else
    #flash[:danger] = 'Invalid activation link'
      render 'new'
    end
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
    @number_of_data_rows = @data.all.count
    @data = @data.page(params[:page]).per(15)
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
        @numericColumns.push(column.id)
      else
        @nonNumericColumns.push(column.id)
      end
    end

    #handle graph for non selected data on X or Y axis
    if params[:column_x].nil?
      @xData = Array.new
      @yData = Array.new

      #set first non-numeric vs first numeric columns into chart's data base
      @data.each do |row|
        @xData.push(row[@nonNumericColumns[0]])
        @yData.push(row[@numericColumns[0]].to_f)
      end
      @columnX = @nonNumericColumns[0]
      @columnY = @numericColumns[0]
    else
      @columnX = params[:column_x].to_i
      @columnY = params[:column_y].to_i
    end
    #prepare variables for the show view buttons - previous and next
    puts "--------------------------------"
    prepare_switch_to_other_column
    draw_graph

    if params[:column_h].nil?
      @hData = "['Shanghai', 23.7],
                    ['Lagos', 16.1],
                    ['Instanbul', 14.2]"
    else
      @hData= change_H(params[:id],params[:column_h])
    end
  end

  def change_type
    @dataset = Dataset.find(params[:id])

    column_to_change_type = @dataset.headers.first.columns.find(params[:column_id])
    column_to_change_type.type_id = params[:type_id]
    column_to_change_type.analyze = true
    column_to_change_type.save

    redirect_to dataset_path(@dataset, :anchor => 'type')
  end

  def header_selection
    @dataset = Dataset.find(params[:id])
    # all columns.show set to FALSE
    @dataset.headers.first.columns.all.order(:id).each do |uncheck|
      uncheck.show = false
      uncheck.save
    end

    # checked columns.show set to TRUE
    params[:columns_checkbox].each do |check|
      column_to_select = @dataset.headers.first.columns.find(check)
      column_to_select.show = true
      column_to_select.save
    end

    redirect_to dataset_path(@dataset)
  end

  def start_analyze
    @dataset = Dataset.find(params[:id])

    @dataset.status = 'S'


    # Toto destroyAll nie je uplne idealne, lepsie by bolo ukladat ku kazdemu zmenemu stlpcu
    # aj to ze z coho bol zmeneny. Inak sa to neda, analyze priznak je nafigu, lebo je syntetizovany
    # z rozdielu previousType, currentType :)
    @dataset.coordinates.destroy_all
    coordinateColumns = @dataset.headers.first.columns.where(type_id: 5)
    coordinateColumns.each do |column|
      AnalyzeFunction.new.delay.count_lat_long(@dataset,column)
    end


    AnalyzeFunction.new.delay.reanalyze(@dataset)


    @dataset.save

    redirect_to datasets_path
  end

  def prepare_switch_to_other_column
    puts "ACTUAL X COLUMN: "+@columnX.to_s
    puts "ACTUAL Y COLUMN: "+@columnY.to_s
    puts "NUM COLUMNS: "+@numericColumns.inspect

    #get next & previous numeric column index
    if(@numericColumns.include? @columnY)
      #next
      @nextNumericColumn = @numericColumns.index(@columnY)+1
      if(@nextNumericColumn >= @numericColumns.count)
        @nextNumericColumn = 0
      end
      puts "INDEX: "+@nextNumericColumn.to_s

      #previous
      @previousNumericColumn = @numericColumns.index(@columnY)-1
      if(@previousNumericColumn < 0)
        @previousNumericColumn = @numericColumns.count-1
      end
    else
      @nextNumericColumn = 0
      @previousNumericColumn = @numericColumns.count-1
    end

    #set next numeric column
    if(@numericColumns[@nextNumericColumn] != nil)
      @nextNumericColumn = @numericColumns[@nextNumericColumn]
    end
    puts "NEXT Y COLUMN: "+@nextNumericColumn.to_s

    #set previous numeric column
    if(@numericColumns[@previousNumericColumn] != nil)
      @previousNumericColumn = @numericColumns[@previousNumericColumn]
    end
    puts "PREV Y COLUMN: "+@previousNumericColumn.to_s
  end

  def draw_graph
    dataset = Dataset.find(params[:id])

    if(@numericColumns.count != 0)
      @columnXName = dataset.headers.first.columns.find(@columnX).label
      @columnYName = dataset.headers.first.columns.find(@columnY).label

      puts "X name: "+@columnXName.to_s
      puts "Y name: "+@columnYName.to_s

      name_of_dataset_data_table = dataset.data_table_name
      data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }


      data=data.order('"'+@columnXName.to_s+'"')
      @yData =data.pluck(@columnYName.to_s)[0..20].collect{|i| i.gsub(/\s/, '').to_f}
      @xData =data.pluck(@columnXName.to_s)[0..20]

      puts 'This is column:'
      puts @xData.inspect
      puts @yData.inspect
      @drawGraph = true;
    else
      @drawGraph = false;
    end
  end

  def change_H(id,columH)

    dataset = Dataset.find(id)
    @columnH=dataset.headers.first.columns.find(columH).label

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

      return @hData
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

  def analyzing?
    dataset = Dataset.find(params[:id])
    if dataset.status == 'S'
      flash[:danger] = "Dataset is being processed now."
      redirect_to datasets_path
    end
  end

  private
  def dataset_params
    params.require(:dataset).permit(:name, :description, :link)
  end
end

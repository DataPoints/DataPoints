class DatasetsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = current_user.datasets.build(dataset_params)
    if @dataset.save
      flash[:success] = 'Dataset successfully uploaded :)'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @dataset = Dataset.find(params[:id])
    if @dataset.update(dataset_params)
      redirect_to @dataset
    else
      render 'edit'
    end
  end
  def index
    # @dataset = Dataset.find(params[:id])
    @Datasets = Dataset.where(user_id: current_user.id, deleted: false).first(10)
    @AnalyzedDatasets = Dataset.where(user_id: current_user.id, deleted: false, analyzed_progress: 0).first(10)

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
    if @dataset.analyzed_progress == 0
      flash[:danger] = 'Sorry :( Dataset not yet analyzed'
      redirect_to datasets_path
      return
    end

    @dataset = Dataset.find(params[:id])
    @headers = @dataset.headers.all
    @columns = @headers.first.columns.all.order(:label)

    name_of_dataset_data_table = @dataset.data_table
    @data = Class.new(ActiveRecord::Base) { self.table_name = name_of_dataset_data_table }

    @number_of_data_rows = @data.count
    if @number_of_data_rows > 15
      @number_of_data_rows = 15
    end

    @names_of_data_columns = @data.column_names
  end

  def change_type
    @dataset = Dataset.find(params[:id])
    column_to_change_type = @dataset.headers.first.columns.find(params[:column_id])
    column_to_change_type.type_id = params[:type_id]
    column_to_change_type.save
    flash[:success] = 'Changes saved!'
    redirect_to :back
  end

  private
  def dataset_params
    params.require(:dataset).permit(:name, :description, :link)
  end
end
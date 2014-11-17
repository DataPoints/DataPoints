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
    @headers = @dataset.headers.all
    @columns = @headers.first.columns.all.order(:label)
  end

  def change_type
    @dataset = Dataset.find(params[:id])
    column_type_change = @dataset.headers.first.columns.find(params[:column_id])
    column_type_change.type_id = params[:type_id]
    column_type_change.save
    flash[:success] = 'Changes saved!'
    redirect_to :back
  end

  private
  def dataset_params
    params.require(:dataset).permit(:name, :description, :link)
  end
end

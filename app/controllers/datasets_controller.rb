class DatasetsController < ApplicationController
  def new
    @dataset = Dataset.new
  end

  def create
    @dataset = current_user.datasets.build(dataset_params)
    if @dataset.save
      flash[:success] = 'Uspesne uploadnuty dataset'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def dataset_params
    params.require(:dataset).permit(:name, :description, :link)
  end
end

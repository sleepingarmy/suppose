class CollectionsController < ApplicationController

  def index
    @collections = Collection.all.by_name
  end

  def show
    @collection = Collection.find_by(id: params[:id])
  end

  def new
    @designers = Designer.all
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      redirect_to collections_path
    else
      flash[:error] = "Could not create collection, please try again."
      render :new
    end
  end

  def edit
    @collection = Collection.find_by(id: params[:id])
  end

  def update
    @collection = Collection.find_by(id: params[:id])
    if @collection.update(collection_params)
      redirect_to collections_path
    else
      render :edit
    end
  end

  def destroy
    @collection = Collection.find_by(id: params[:id])
    @collection.destroy
    redirect_to collections_path
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :designer_name, :designer_id)
  end
end

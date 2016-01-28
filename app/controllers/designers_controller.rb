class DesignersController < ApplicationController
  def index
    @designers = Designer.all.by_name
  end

  def show
    @designer = Designer.find(params[:id])
  end

  def new
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(designer_params)
    if @designer.save
      redirect_to designers_path
    else
      flash[:error] = "Could not create designer, please try again."
      render :new
    end
  end

  def edit
    @designer = Designer.find_by(id: params[:id])
  end

  def update
    @designer = Designer.find_by(id: params[:id])
    if @designer.update(designer_params)
      redirect_to designers_path
    else
      render :edit
    end
  end

  def destroy
    @designer = Designer.find_by(id: params[:id])
    @designer.destroy
    redirect_to designers_path
  end

  private
  def designer_params
    params.require(:designer).permit(:name, :bio, :company_id)
  end
end

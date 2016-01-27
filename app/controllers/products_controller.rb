class ProductsController < ApplicationController
  before_action :sale
  before_action :new_arrivals
  before_action :coming_soon

  def index
    @products = Product.all.by_name
    @sale_products = Product.where(on_sale: true)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.collection_id = @product.collection.id
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to products_path
  end

  def sale
    @sale_products = Product.where(on_sale: true)
  end

  def coming_soon
    @coming_soon = Product.where(status: 'coming soon')
  end

  def new_arrivals
    # @new_arrivals = Product.where(status: 'new')
    # or
    @new_arrivals = Product.where("created_at > ?", Date.today.months_ago(3))
    # there should be some funcitonality that takes new status off after 3 months or something
  end

  private
  def product_params
    params.require(:product).permit(:name, :designer, :collection, :color, :category, :price, :on_sale, :keywords, :collection_id, :substrate)
  end
end

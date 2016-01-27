class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :sale
  before_action :new_arrivals
  before_action :coming_soon

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

  def precuts
    @precuts = Product.where(category: 'precuts')
  end

end

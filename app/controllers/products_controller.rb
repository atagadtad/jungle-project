class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @count = @products.count
  end

  def show
    @product = Product.find params[:id]
  end

end

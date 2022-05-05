class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
      @product = Product.new
  end
  def create
      @product = Product.create(params.require(:product).permit(:name, :brand_name))
      if   @product.valid?
        redirect_to products_path
      else
        flash[:errors] = @product.errors.full_messages
        redirect_to products_path
      end
  end
  def show
      @product = Product.find(params[:id])
  end
  def edit
      @product = Product.find(params[:id])
  end
  def update
      @product = Product.find(params[:id])
      @product.update(params.require(:product).permit(:name, :brand_name))
      redirect_to products_path(@product)
  end
  def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
  end
  
  
end
   
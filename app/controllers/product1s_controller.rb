class Product1sController < ApplicationController
before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @product1s = Product1.all
  end
  
  def new
    @product1 = Product1.new
  end
  
  def create
    @product1 = Product1.create(product1_parmas)
    if @product1.valid?
      redirect_to product1s_path
    else
      flash[:errors] = @product1.errors.full_messages
      redirect_to product1s_path
    end
  end
  
  def show
  end
  
  def edit
  end

  def show_product
    @product1=Product1.all
  end
  
  def update
    @product1.update(product1_parmas)
    redirect_to product1s_path(@product1)
  end
  
  def destroy
    @product1 = Product1.unscoped.find(params[:id])
    if @product1.destroy
      redirect_to product1s_path
    end
  end

  def product1_parmas
    params.require(:product1).permit(:title,:description, :price, :capacity, :is_active, :status)
  end

  def find_product
    @product1 = Product1.unscoped.find(params[:id])
  end
end 

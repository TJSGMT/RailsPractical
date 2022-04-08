class OrdersController < ApplicationController
  before_action :findorder ,only: [:show ,:edit ,:update ,:destroy]
  
  def index
    @orders = Order.all
    searchParams = [:search_query, :query]
    if params[:searchParams]
      @orders = Order.all
      @orders = Order.where(status:'booked') if params[:searchParams] == 'booked'
      @orders = Order.where(status:'cancelled') if params[:searchParams] == 'cancelled'
      @orders_by_product = Order.where("product1_id=?",Product1.where("title = ?",params[:searchParams]).pluck(:id))
    else
      @orders = Order.all
    end
  end

  def new
    @order = Order.new
    @product1 = Product1.all
  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
      redirect_to orders_path
    else 
        flash[:errors] =@order.errors.full_messages
        redirect_to new_order_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to orders_path(@order)
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  def findorder
    @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:quantity, :total_price, :status,:customer_id,:product1_id)
  end
    
end

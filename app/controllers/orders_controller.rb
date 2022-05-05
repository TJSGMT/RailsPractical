class OrdersController < ApplicationController
before_action :findorder ,only: [:show ,:edit ,:update ,:destroy]

  def index
    @orders = Order.all
    @orders = @orders.where(status:'booked') if params[:status] == 'booked'
    @orders = @orders.where(status:'cancelled') if params[:status] == 'cancelled'
    if params[:product_name].present?
      @product1_id = Product1.where("title = ?",params[:product_name]).pluck(:id)
      @orders = @orders.where(product1_id: @product1_id)  
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
    
  def show_order
    @product_by_quantity = Order.select("customer_id, sum(quantity) as Sum_Quantity").group("customer_id").order(Sum_Quantity: :desc).first(3)
    @product_by_price = Order.select("customer_id, sum(total_price) as Sum_Total_price").group("customer_id").order(Sum_Total_price: :desc).first(3)
    @booked = Order.group(:customer_id).where(status:0)
    @cancel = Order.group(:customer_id).where(status:1)
  end
end

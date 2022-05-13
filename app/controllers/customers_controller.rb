class CustomersController < ApplicationController
before_action :find_customer, only: [:show, :edit, :update, :destroy]

  def index
      @customers = Customer.all
  end
  
  def new
      @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      flash[:errors] = @customer.errors.full_messages
      redirect_to new_customer_path  
    end
  end

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to customers_path(@customer)
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:fname, :lname, :email, :phone_number)
  end
end

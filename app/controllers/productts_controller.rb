class ProducttsController < ApplicationController
before_action :findproductt ,only: [:edit ,:show ,:update ,:destroy]  

  def index
    @productts = Productt.all
    # @orderrs = Orderr.find(params[:orderid])
  end

  def new
    @productt = productt.new
  end

  def create
    @productt = Productt.create(Productt_params)
  end

  def edit
  end

  def update
    @productt.update(productt_parmas)
    redirect_to  new_productt_path
  end

  def show
  end

  def destroy
  end
  
  def findproductt
    @productt = Productt.find(params[:id])
  end

  private
  def Productt_params
     params.require(:productt).permit(:name, :description, :price)
  end
end

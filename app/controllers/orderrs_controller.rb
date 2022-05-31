class OrderrsController < ApplicationController
before_action :findorderr ,only: [:show ,:edit ,:update ,:delete]

  def index
    @orderrs = Orderr.all
  end

  def new
    @orderr = Orderr.new
  end

  def create
    @orderr = Orderr.create(orderr_params)
    if @orderr.valid?
      redirect_to orderr_path
    else
        flash[:errors]= @orderr.errors.full_messages
        redirect_to orderrs_path
    end
  end

  def edit
  end

  def show
  end

  def update
    @orderr.update(orderr_params)
    redirect_to orderr_path(@orderr)
  end

  def delete
    @orderr.delete
    redirect_to orderr_path
  end

  def findorderr
    @orderr =  Orderr.find(params[:id])
  end

  private
  def orderr_params
    params.require(:orderr).permit(:quantity, :total_price)
  end
end

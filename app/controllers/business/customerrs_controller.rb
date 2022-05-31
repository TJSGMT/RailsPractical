class Business::CustomerrsController < ApplicationController
  
  def index
    @customerrs =  Customerr.all
  end

  def create
    @customerr = Customerr.new(params.(:customerr).permit(:firstname, :lastname, :email, :ph_no))
  end

  def edit
    @customerr = Customerr.find(params[:id])
  end
end

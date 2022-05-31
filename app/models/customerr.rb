class Customerr < ApplicationRecord
  
  def index
    @customerrs = Customerr.all  
  end
  
  def create
    @customerr = Customerr.new
    if @customerr.valid?
      redirect_to customerr_path
    else
      flash[:errors]= @customerr.errors.full_messages
      redirect_to customerrs_path
    end
  end

  def edit
      @customerr = Customerr.find(params[:id])    
  end
end

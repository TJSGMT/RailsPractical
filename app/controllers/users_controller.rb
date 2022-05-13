class UsersController < ApplicationController
  before_action :find_user, only:[:edit, :update, :enroll_event]
  def new
    @user = User.new
    @Address = Address.new
  end

  def create
    @user = User.new(user_params)
    @user.flag = true
    if @user.save
      session[:user_id] = @user.id
      @address = Address.new(Addresses: params[:address],user_id: @user.id)
      if @address.save
        redirect_to events_path, notice: 'Successfully created account'  
      else
        render :new, :alert => "Wrong credentials!"
      end
    end  
  end

  def edit  
  
  end

  def update
    if @user.update(user_params)
      flash[:errors] = "Successfull!"
      redirect_to events_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def enroll_event
    if session[:user_id] 
        Enrollment.create(user_id:session[:user_id],event_id:params[:event_id])
        redirect_to user_path(@current_user.id)
    end
  end
  def unroll_event
    Enrollment.delete_by("user_id= and event_id?",@current_user.id,params[:event_id])
    redirect_to events_path
  end

  def show
    @user = User.find(params[:id])
    events = Enrollment.select(:event_id).where(user_id: @user.id,status:false)
    event_ids = Array.new
    events.each do |e|
      event_ids.push(e.event_id)
    end
      @enrolled_events = Event.find(event_ids)
  end

  def require_login
    @user = User.new
  end
  
  def find_user
    @user = User.find_by(id: session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:Username, :password)
  end
end

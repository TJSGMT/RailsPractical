class EventsController < ApplicationController
before_action :find_event, only: [:show, :edit, :update, :destroy, :join_event]

  def index
    @events = Event.all
    if params[:category]
      c = Category.select(:id).where(category: params[:category])
      @events = Event.where(category_id: c[0].id)
    end
  end

  def clear
    redirect_to events_path
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    category_id = Category.select(:id).where(category: params[:event][:category])
    @event.category_id = category_id[0].id
    if @event.save
       @enrollment = Enrollment.create(user_id:session[:user_id], event_id:@event.id,status:true)
      redirect_to events_path
    else
      flash[:notice] = @event.errors.full_messages
    end
  end

  def show
    @enrollment = Enrollment.where(event_id: @event.id, status:true)
    
    @enroll_user = User.find(@enrollment[0].user_id)
  end

  def edit  
  end

  def update
    @event.update(event_params)
    redirect_to events_path
  end
  
  def destroy
    @event.destroy
    redirect_to events_path
  end
  
  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date)
  end
  
  def users

  end
  def view_event
    # @desending_name = Event.order('name DESC')
  end
  def join_event
    @enrollment= Enrollment.new(event_id:@event.id,user_id:session[:user_id],status:false)
    @enrollment.save
    redirect_to events_path
  end
end

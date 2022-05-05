class CommentsController < ApplicationController
  before_action :find_comment ,only: [:show, :edit, :update, :delete, :like, :unlike]
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @event = Event.find(params[:format])
  end

  def create
    @comment =  Comment.new(comment_params)
    @comment.event_id = params[:format]
    @comment.user_id = session[:user_id]
    if @comment.save
      redirect_to event_path(params[:format])
    end
  end

  def show
  end   

  def edit
  end

  def update
  end

  def delete
    @comment.destroy
    event_id = @comment.event_id
    redirect_to event_path(event_id)
  end

  def like
    @comment.liked_by.push(session[:user_id])
    @comment.save
    event_id = @comment.event_id
    redirect_to event_path(event_id)
  end

  def unlike
    @comment.liked_by.delete(session[:user_id])
    @comment.save
    event_id = @comment.event_id
    redirect_to event_path(event_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

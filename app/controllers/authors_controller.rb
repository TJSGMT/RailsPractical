class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update]

  def index
    @authors= Author.all
  end
  def new 
    @author = Author.new
  end
  def create
    @author = Author.new(params.require(:author).permit(:first_name,:last_name,:dob,:email))
    if @author.save
      redirect_to authors_path
    else
      flash[:notice] = @author.errors.full_messages
      redirect_to new_author_path
    end
  end
  def show
    @author = Author.find(params[:id])
  end
  def edit
  end
  def update
    @author = Author.find(params[:id])
    @author.update(params.require(:author).permit(:first_name,:last_name,:dob,:email))
    redirect_to authors_path
  end
  def destroy
    @author = Author.find(params[:id].to_i) 
       @author.destroy
    redirect_to authors_path
  end
  private
  def find_author
    @author = Author.find(params[:id])
  end
end

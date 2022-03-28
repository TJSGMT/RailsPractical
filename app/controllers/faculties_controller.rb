class FacultiesController < ApplicationController
  def index
    @faculties= Faculty.all
  end 

    def new 
    @faculty = Faculty.new
  end

  def create
      @faculty = Faculty.new(faculty_parmas)
    if @faculty.save
      redirect_to faculties_path
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to new_faculty_path
    end 
  end

  def show
      @faculty = Faculty.find(params[:id])
  end

  def edit
      @faculty = Faculty.find(params[:id])
  end

  def update
      @faculty = Faculty.find(params[:id])
    if @faculty.update(faculty_parmas)
      flash[:errors] = "Successfull!"
      redirect_to faculties_path
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to edit_faculty_path
    end 
  end

  def destroy
      @faculty = Faculty.find(params[:id].to_i) 
      @faculty.destroy
      redirect_to faculties_path
  end
  
    private
    def faculty_parmas
    params.require(:faculty).permit(:firstname,:lastname,:birthdate,:phone_no,:designation,:email)
  end
end

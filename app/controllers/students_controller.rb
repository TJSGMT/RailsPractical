class StudentsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end 

  def new 
    @student = Student.new
  end 

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end 
  end

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:errors] = "Successfull!"
      redirect_to students_path
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path
    end 
  end
  
  def destroy
      @student = Student.find(params[:id].to_i) 
      @student.destroy
      redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:firstname,:lastname,:birthdate,:department,:terms_of_usage,:email)
  end

  def set_params
    @student = Student.find(params[:id])
  end
end

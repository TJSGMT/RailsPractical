class EmployeesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]

  def index
    @employees = Employee.all
    if params[:search_query]
      if Employee.find_by("email = ?",params[:search_query])
        flash[:notice]="Valid Email!!!!!"
      else
        flash[:notice]="Invalid email!!!"
      end
    end
  end

  def new 
    @employee = Employee.new
  end 

  def create  
    @employee = Employee.find_or_create_by(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end   
  end

  def show
  end      

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:errors] = "Successfull!"
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end 
  end
  
  def destroy
      @employee = Employee.find(params[:id].to_i) 
      @employee.destroy
      redirect_to employees_path
  end
  
  def search

  end

  def view_employees
      @limitage= Employee.where('age> 20' && 'age < 40')
      @Aemp = Employee.where("full_time_available= 'Yes' ")
      @Gage = Employee.where("no_of_order=5 and age> 25")
      @Lage =Employee.where("no_of_order=5 and age < 25")
      @salary =Employee.where('Salary> 45000')
      @Group=Employee.group("no_of_order").having("no_of_order> ?",5)
      @asc=Employee.order('no_of_order ASC')
      @desc=Employee.order('age DESC ')
      @unscope=Employee.where(' no_of_order> 30').limit(10).order('no_of_order DESC').unscope(:order)
      @only=Employee.where('age> 40').limit(5).order('age desc').only(:order,:where)
      @reselect=Employee.select(:email, :no_of_order).reselect(:firstname, :lastname)
      @reorder=Employee.order('email DESC').reorder('id ASC')
      @revorder=Employee.where("no_of_order> 20").reverse_order
      @today=Employee.where("created_at < ?", 1.days.ago)
  end

  def increase
    @temp = Employee.find_in_batches(batch_size:5)
      @temp.first.each do |e|
        e.no_of_order += 1
        e.save
      end
      redirect_to employees_path(@employee)
  end

  def decrease
    @temp = Employee.find_in_batches(batch_size:5)
      @temp.first.each do |e|
        e.no_of_order -= 1
        e.save
      end
      redirect_to employees_path(@employee)
  end

  private
  def employee_params
    params.require(:employee).permit(:firstname,:lastname,:email,:age,:no_of_order,:full_time_available,:salary)
  end

  def set_params
    @employee = Employee.find(params[:id])
  end
end

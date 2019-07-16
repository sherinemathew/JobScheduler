class EmployeesController < ApplicationController
  def add
    @employee = Employee.new
  end

  def create
    employee = Employee.new
    employee.first_name = params[:employee][:first_name]
    employee.last_name = params[:employee][:last_name]
    employee.phone_number = params[:employee][:phone_number]

    if employee.save
      redirect_to root_path
    else
      flash[:alert] = employee.errors.full_messages[0]
      redirect_to add_new_employee_path
    end
  end

  def delete
    Employee.find(params[:id])&.destroy
    redirect_to root_path
  end
end

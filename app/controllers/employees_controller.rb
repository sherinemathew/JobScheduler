class EmployeesController < ApplicationController
  def add
    @employee = Employee.new
  end

  def create
    employee = Employee.new
    employee.first_name = params[:employee][:first_name]
    employee.last_name = params[:employee][:last_name]
    employee.phone_number = params[:employee][:phone_number]
    employee.save
    redirect_to root_path
  end

  def delete
    Employee.find(params[:id])&.destroy
    redirect_to root_path
  end
end

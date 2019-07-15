class JobsController < ApplicationController
  def index
  end

  def show
    @job = Job.find(params[:id])
    @available_employees = Employee.where(job: nil).order(first_name: :asc)
  end

  def delete
    job = Job.find(params[:id])
    job.destroy
    redirect_to root_path
  end

  def update
    job = Job.find(params[:job][:job_id])
    job.start_date = Date.new params[:job]["start_date(1i)"].to_i, params[:job]["start_date(2i)"].to_i, params[:job]["start_date(3i)"].to_i
    job.days_to_complete = params[:job][:days_to_complete]
    job.save
    redirect_to show_job_path(job.id)
  end

  def add_employee
    job = Job.find(params[:job][:job_id])
    employee = Employee.find(params[:job][:employees])
    employee.job = job
    employee.save
    redirect_to show_job_path(job.id)
  end

  def mark_job_completed
    job = Job.find(params[:job][:job_id])
    job.complete = params[:job][:complete]
    job.save
    redirect_to root_path
  end

  def add
    @job = Job.new
  end

  def create
    job = Job.new
    job.user = current_user
    job.name = params[:job][:name]
    job.location = params[:job][:location]
    job.days_to_complete = params[:job][:days_to_complete]
    job.complete = false
    job.start_date = Date.new params[:job]["start_date(1i)"].to_i, params[:job]["start_date(2i)"].to_i, params[:job]["start_date(3i)"].to_i
    job.save
    redirect_to root_path
  end

  def edit
  end
end

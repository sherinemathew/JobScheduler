class JobsController < ApplicationController
  def index
  end

  def show
    @job = Job.find(params[:id])
    
    # Need to modify to include employees where their current job's end date is before this job's start date
    @available_employees = []
    Employee.all.order(first_name: :asc).each { |emp|
      available = true

      emp.jobs.each { |job|
        if @job.start_date <= job.end_date && @job.end_date >= job.start_date
          available = false
          break
        end
      }
      
      @available_employees << emp if available
    }
  end

  def delete
    job = Job.find(params[:id])
    job.remove_employees
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
    employee.jobs << job
    employee.save
    redirect_to show_job_path(job.id)
  end

  def mark_job_completed
    job = Job.find(params[:job][:job_id])
    job.complete = params[:job][:complete]
    job.remove_employees
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

class JobsController < ApplicationController
  def index
  end

  def show
    @job = Job.find(params[:id])
    @available_employees = Employee.all
  end

  def update
    job = Job.find(params[:id])
    job.start_date = Date.new params[:job]["start_date(1i)"].to_i, params[:job]["start_date(2i)"].to_i, params[:job]["start_date(3i)"].to_i
    job.days_to_complete = params[:job][:days_to_complete]
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

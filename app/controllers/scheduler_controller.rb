class SchedulerController < ApplicationController
  before_action :check_login_status
  
  def index
    @jobs = Job.where(user: current_user).order(complete: :asc).order(start_date: :asc).order(days_to_complete: :asc)
  end

  def check_login_status
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

class SchedulerController < ApplicationController
  before_action :check_login_status
  
  def index
    @jobs = Job.where(user: current_user)
  end

  def check_login_status
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end
  private

  def user_is_current_user
    unless current_user.id == params[:workout][:user_id].to_i
      flash[:notice] = "You may only view your own workouts."
      redirect_to root_path
    end

  end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    cookies.permanent[:id] = @user.id
    redirect_to root_url
  end

  def show
    user_id = params[:id]
    redirect_to login_url and return unless User.exists?(user_id)
    @user = User.find(user_id)
    @events = Event.where(creator_id: user_id)
    @invitations = @user.invitations
    @future_events_attending = @user.attendings.future_events
    @past_events_attended    = @user.attendings.past_events
  end

  def logout
    cookies.permanent[:id] = nil
    redirect_to root_url
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

end

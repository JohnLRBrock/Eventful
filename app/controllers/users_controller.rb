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
    id = params[:id]
    redirect_to login_url unless User.exists?(id)
    @user = User.find(id)
    @events = Event.where(creator_id: id)
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

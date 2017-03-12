class EventsController < ApplicationController
  def new
    redirect_unless_authorized
    @event = Event.new
  end

  def create
    redirect_unless_authorized
    @user = events_current_user
    @event = @user.events.build(event_params)
    if @event.save
      redirect_to event_url(@event.id)
    else
      render 'create'
    end
  end

  def show
    event_id = params[:id]
    redirect_to root_url and return unless Event.exists?(event_id)
    @event = Event.find(event_id)
    @attendees = @event.attendees
    if events_logged_in?
      user_id = events_current_user.id
      @logged_in = true
      @user = events_current_user
      @is_attending = @user.attendings.exists?(event_id)
    end
    @users = User.where("id <> ?", user_id) if @logged_in
  end
      
  def index
    @past_events   = Event.past_events
    @future_events = Event.future_events
  end

  def invite
    user_id  = params[:user_id]
    event_id = params[:event_id]
    if User.exists?(user_id) && Event.exists?(event_id)
      event = Event.find(event_id)
      user  = User.find(user_id)
      event.invitees << user
      redirect_to event_path(params[:event_id])
    else
      redirect_to root_url
    end
  end

  def attend
    user_id  = params[:user_id]
    event_id = params[:event_id]
    if User.exists?(user_id) && Event.exists?(event_id)
      user  = User.find(user_id)
      event = Event.find(event_id)
      user.attendings << event unless user.attendings.exists?(event_id)
    end
    redirect_to event_url(params[:event_id])
  end

  def events_current_user
    id = cookies.permanent[:id]
    return User.find(id) if id && User.exists?(id)
    nil
  end

  def events_logged_in?
    !!events_current_user
  end

  def redirect_unless_authorized
    redirect_to login_url unless events_logged_in?
  end
  private
    def event_params
      params.require(:event).permit(:description, :name, :datetime, :location)
    end
end

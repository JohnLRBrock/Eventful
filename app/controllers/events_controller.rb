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
    id = params[:id]
    redirect_to root_url unless Event.exists?(id)
    @event = Event.find(id)
    @attendees = @event.attendees
  end
      
  def index
    @events = Event.all
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

class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.user_id = current_user.id
    @event.save
    redirect_to events_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

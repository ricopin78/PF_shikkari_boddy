class EventsController < ApplicationController

  def index
    @events = current_user.events
    @event = Event.new
    @users = User.all
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    @comment = current_user.comments.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(update_event_params)
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end

  private

  def event_params
    params.require(:event).permit(:title, :overview, :start_time, :finish_time, :user_id, relevant_parties_attributes: [:user_id, :attendance])
  end

  def update_event_params
    params.require(:event).permit(:title, :overview, :start_time, :finish_time, :user_id, relevant_parties_attributes: [:user_id, :attendance, :_destroy, :id])
  end

end
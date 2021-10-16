class EventsController < ApplicationController

  def index
    @events = Event.all
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @relevant_party = @event.relevant_parties.where(user_id: current_user.id)
    @comments = @event.comments
    @comment = current_user.comments.new
    @event_todo = EventTodo.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path
    else
      @events = current_user.events
      render :index
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(update_event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path(current_user)
    else
      @events = current_user.events
      　 @event = Event.new
      render :show, notice: '削除できませんでした'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :overview, :start_time, :finish_time, :user_id, relevant_parties_attributes: [:user_id, :attendance])
  end

  def update_event_params
    params.require(:event).permit(:title, :overview, :start_time, :finish_time, :user_id, relevant_parties_attributes: [:user_id, :attendance, :_destroy, :id])
  end

end

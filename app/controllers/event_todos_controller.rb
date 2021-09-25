class EventTodosController < ApplicationController

  def show
    @event_todo = current_event.event_todos.find(params[:id])
  end

  def create
    @event_todo = EventTodo.new(event_todo_params)
    @event = Event.find(params[:event_id])
    if @event_todo.save
      redirect_to event_path(@event)
    else
      @event = Event.find(params[:event_id])
      @relevant_party = @event.relevant_parties.where(user_id: current_user.id)
      @comments = @event.comments
      @comment = current_user.comments.new
      @event_todo = EventTodo.new
      render 'events/show'
    end
  end

  def update
    @event_todo = current_event.event_todos.find(params[:id])
    if @event_todo.update(event_todo_params)
      redirect_to event_path
    else
      render :show
    end
  end

  def destroy
    @event_todo = current_event.event_todos.find(params[:id])
    @event_todo.destroy
    redirect_to event_path
  end

  private

  def event_todo_params
    params.require(:event_todo).permit(:event_id, :title, :body, :deadline, :duration, :completed, :priority)
  end

  def event_params
    params.require(:event).permit(:title, :overview, :start_time, :finish_time, :user_id, relevant_parties_attributes: [:user_id, :attendance])
  end

end

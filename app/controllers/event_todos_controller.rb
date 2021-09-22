class EventTodosController < ApplicationController

  def show
    @event_todo = current_event.event_todos.find(params[:id])
  end

  def create
    @event_todo = EventTodo.new(event_todo_params)
    @event_todo.save
    redirect_to event_path
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
    params.require(:event_todo).permit(:title, :body, :user_id, :deadline, :duration, :completed, :priority)
  end

end

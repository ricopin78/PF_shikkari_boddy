class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @user = current_user
    @todos0 = Todo.where(user_id: @user.id, priority: "重要×緊急")
    @todos1 = Todo.where(user_id: @user.id, priority: "重要×緊急でない")
    @todos2 = Todo.where(user_id: @user.id, priority: "重要でない×緊急")
    @todos3 = Todo.where(user_id: @user.id, priority: "重要でない×緊急でない")
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    @user = current_user
    @todo.user_id = @user.id
    if @todo.save
      redirect_to user_todos_path
    else
      @todos0 = Todo.where(user_id: @user.id, priority: "重要×緊急")
      @todos1 = Todo.where(user_id: @user.id, priority: "重要×緊急でない")
      @todos2 = Todo.where(user_id: @user.id, priority: "重要でない×緊急")
      @todos3 = Todo.where(user_id: @user.id, priority: "重要でない×緊急でない")
      render :index
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to user_todo_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to user_todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :user_id, :deadline, :duration, :completed, :priority)
  end
end

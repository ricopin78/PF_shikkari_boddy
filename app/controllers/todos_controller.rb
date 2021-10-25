class TodosController < ApplicationController

  before_action :set_q

  def index
    @todo = Todo.new
    @user = current_user
    @todos0 = Todo.where(user_id: @user.id, priority: "重要×緊急", completed: true).order("deadline")
    @todos1 = Todo.where(user_id: @user.id, priority: "重要×緊急でない", completed: true).order("deadline")
    @todos2 = Todo.where(user_id: @user.id, priority: "重要でない×緊急", completed: true).order("deadline")
    @todos3 = Todo.where(user_id: @user.id, priority: "重要でない×緊急でない", completed: true).order("deadline")
    @todos_completed = Todo.where(user_id: @user.id, completed: false).order("deadline")
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    if @todo.save
      redirect_to user_todos_path
    else
      @user = current_user
      @todos0 = Todo.where(user_id: @user.id, priority: "重要×緊急").order("deadline")
      @todos1 = Todo.where(user_id: @user.id, priority: "重要×緊急でない").order("deadline")
      @todos2 = Todo.where(user_id: @user.id, priority: "重要でない×緊急").order("deadline")
      @todos3 = Todo.where(user_id: @user.id, priority: "重要でない×緊急でない").order("deadline")
      @todos_completed = Todo.where(user_id: @user.id, completed: false).order("deadline")
      render :index
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to user_todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
    redirect_to user_todos_path
  end

  def search
    @results = @q.result
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :user_id, :deadline, :duration, :completed, :priority)
  end

  def set_q
    @q = current_user.todos.ransack(params[:q])
  end

end

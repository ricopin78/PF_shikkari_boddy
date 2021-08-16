class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    byebug
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    Comment.find_by(id: params[:id], event_id: params[:event_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :event_id)
  end

  def event_params
    params.require(:event).permit(:title, :overview, :start_time, :finish_time, :user_id)
  end

end

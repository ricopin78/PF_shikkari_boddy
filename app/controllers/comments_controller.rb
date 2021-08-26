class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.event_id = params[:event_id]
    if @comment.save
      redirect_to event_path(@comment.event_id)
    else
      @event = Event.find(params[:event_id])
      @comments = @event.comments
      render 'events/show'
    end
  end

  def destroy
    @comment = Comment.find_by(params[:id],params[:event_id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :event_id, :user_id)
  end

  def event_params
    params.require(:event).permit(:title, :overview, :start_time, :finish_time, :user_id, relevant_parties_attributes: [:user_id, :attendance])
  end
end

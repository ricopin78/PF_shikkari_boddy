class RelevantPartiesController < ApplicationController

  def update
    @relevant_party = RelevantParty.find_by(params[:id],params[:event_id])
    @relevant_party.user_id = current_user.id
    if @relevant_party.update(relevant_party_params)
      redirect_to event_path
    else
      render "events/show"
    end
  end

  private

  def relevant_party_params
    params.permit(:attendance, :event_id, :user_id)
  end

  def relevant_partu_params
    params.require(:todo).permit(:title, :body, :user_id, :deadline, :duration, :completed, :priority)
  end

end

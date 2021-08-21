class OkeysController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    okey = current_user.okeys.create(event_id: params[:event_id])
    okey.save
  end

  def destroy
    @event = Event.find(params[:event_id])
    okey = Okey.find_by(event_id: params[:event_id], user_id: current_user.id)
    okey.destroy
  end

end

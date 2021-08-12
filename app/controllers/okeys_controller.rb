class OkeysController < ApplicationController
  def create
    @okey = current_user.okeys.create(event_id: params[:event_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @okey = Okey.find_by(event_id: params[:event_id], user_id: current_user.id)
    @okey.destroy
    redirect_back(fallback_location: root_path)
  end
end

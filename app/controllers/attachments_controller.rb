class AttachmentsController < ApplicationController
  def create
    @attachment = Attachment.create!(file_params)
    @attachment.event_id = params[:event_id]
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    if @attachment.destroy
      render :json => { result: 'success' }
    else
      render :json => { result: 'error' }
    end
  end

  private

  def create_params
    params.require(:file).permit(:event_id, :file_name, :file)
  end

  def event_params
    params.require(:event).permit(:id)
  end
end

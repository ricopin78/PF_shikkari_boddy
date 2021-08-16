class AttachmentsController < ApplicationController

  def create
    @attachment = Attachment.create!(file_params)
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
end

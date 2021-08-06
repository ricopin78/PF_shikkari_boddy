class TitlesController < ApplicationController

  def new
    @title = Title.new
  end

  def create
    @title = Title.new
    @title.save
    redirect_to user_path
  end

  def update
    @title = Title.find(params[id])
    @title.update(title_params)
    redirect_to user_path
  end

  def destroy
    @title = Title.find(params[id])
    @title.destroy
    redirect_to user_path

  end

  private

  def title_params
    params.require(:title).permit(:department, :position)
  end

end

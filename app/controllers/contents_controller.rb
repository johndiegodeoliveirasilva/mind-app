class ContentsController < ApplicationController
  before_action :authenticate_user! 

  def index
    @contents = current_user.contents
  end

  def new
    @content = Content.new
  end

  def create
    @content = Contente.new(content_params)

    if @content.save
      redirect_to @content
    else
      render new
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :description)
  end

  def set_content
    @content = Content.find(params[:id])
  end
end

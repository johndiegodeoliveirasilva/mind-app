class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: [:edit, :show, :update, :destroy]

  def index
    @contents = current_user.contents
  end

  def new
    @content = Content.new
  end

  def create
    @content = current_user.contents.build(content_params)

    if @content.save
      redirect_to @content, notice: 'Content successfully created!'
    else
      render :new
    end
  end
  def edit; end

  def show; end

  def update
    if @content.update(content_params)
      redirect_to @content, notice: 'Content successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @content.destroy

    redirect_to contents_path, notice: 'Content successfully updated! '
  end

  private

  def content_params
    params.require(:content).permit(:title, :description)
  end

  def set_content
    @content = Content.find(params[:id])
  end
end

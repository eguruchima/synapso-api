class NotesController < ApplicationController
  def index
    @notes = Note.all
    render :index
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def create
    @note = Note.create(
      title: params[:title],
      content: params[:content],
      user_id: params[:user_id]
    )
    render :show
  end
end

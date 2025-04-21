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

  def update
    @note = Note.find(params[:id])
    @note.update(
      title: params[:title] || @note.title,
      content: params[:content] || @note.content
    )
    render :show
  end
end

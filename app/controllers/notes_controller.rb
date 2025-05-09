class NotesController < ApplicationController
  before_action :authenticate_user

  def index
    @notes = current_user.notes
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
      user_id: current_user.id
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

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    head :no_content
  end
end

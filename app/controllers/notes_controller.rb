class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
    # redirect_to '/'
  end

  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to notes_path
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def destroy
    id = params[:id]
    @note = Note.find(id)
    @note.destroy
  end

  def priority
    @note_priority = Note.select(:priority).distinct
  end

  def status
    @note_status = Note.select(:status).distinct
  end

  private

  def note_params
    params.require(:note).permit(:comment, :priority, :status, :due_date)
  end
end

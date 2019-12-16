class NoteController < ApplicationController
  def store
    @note = Note.new(note_params)
    @note.save
    # redirect_to '/'
  end

  def index
    @notes = Note.all
  end

  def create
  end

  def destroy
  end

  def update
  end

  private

  def note_params
    params.require(:note).permit(:note)
  end
end

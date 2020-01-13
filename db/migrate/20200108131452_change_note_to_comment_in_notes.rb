class ChangeNoteToCommentInNotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :note, :text
    add_column :notes, :comment, :text
  end
end

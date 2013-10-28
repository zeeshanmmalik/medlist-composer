class AddNoteToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :note, :string
  end
end

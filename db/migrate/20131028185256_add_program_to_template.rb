class AddProgramToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :program, :string
  end
end

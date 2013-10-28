class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :line
      t.references :drug, index: true

      t.timestamps
    end
    add_index :instructions, :id, unique: true
  end
end

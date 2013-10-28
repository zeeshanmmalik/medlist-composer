class CreatePharmacists < ActiveRecord::Migration
  def change
    create_table :pharmacists do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    add_index :pharmacists, :id, unique: true
  end
end

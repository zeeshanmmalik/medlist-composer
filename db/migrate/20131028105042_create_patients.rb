class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :mrn
      t.date :date_of_birth
      t.string :program
      t.datetime :admission_date
      t.datetime :discharge_date
      t.integer :pharmacist_id

      t.timestamps
    end
    add_index :patients, :id, unique: true
    add_index :patients, :mrn, unique: true
    add_index :patients, :program
    add_index :patients, :pharmacist_id
  end
end

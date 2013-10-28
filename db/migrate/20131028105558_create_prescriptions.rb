class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.references :patient, index: true
      t.references :pharmacist, index: true
      t.string :physician
      t.integer :base_template_id

      t.timestamps
    end
    add_index :prescriptions, :id, unique: true
    add_index :prescriptions, :base_template_id
    add_index :prescriptions, :physician
  end
end

class AddColumnsToPrescription < ActiveRecord::Migration
  def change
    add_column :prescriptions, :alergies, :string
    add_column :prescriptions, :note, :string
    add_column :prescriptions, :base_template_type, :string
  end
end

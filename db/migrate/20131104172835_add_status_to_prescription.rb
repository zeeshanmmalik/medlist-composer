class AddStatusToPrescription < ActiveRecord::Migration
  def change
    add_column :prescriptions, :status, :string, default: 'new'
  end
end

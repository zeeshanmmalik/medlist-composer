class AddOrderNoToDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :order_no, :integer
  end
end

class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :generic_name
      t.string :strength
      t.string :brand_name
      t.string :purpose
      t.string :am_check
      t.string :am_time
      t.string :noon_check
      t.string :noon_time
      t.string :supper_check
      t.string :supper_time
      t.string :bedtime_check
      t.string :bedtime_time

      t.references :drugable, polymorphic: true

      t.timestamps
    end
    add_index :drugs, :id, unique: true
    add_index :drugs, [:drugable_id, :drugable_type], name: 'drugable_index'
  end
end

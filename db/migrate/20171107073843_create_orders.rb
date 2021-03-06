class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :ad, index: false, foreign_key: true
      t.integer :status, default: 0
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

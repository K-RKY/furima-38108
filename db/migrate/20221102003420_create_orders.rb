class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_kye: true
      t.references :item, null: false, foreign_kye: true
      t.timestamps
    end
  end
end

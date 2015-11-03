class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :designer
      t.string :collection
      t.string :color
      t.string :category
      t.float :price
      t.boolean :on_sale, default: false
      t.string :keywords
      t.belongs_to :collection

      t.timestamps null: false
    end
  end
end

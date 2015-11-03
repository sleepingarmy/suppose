class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :designer
      t.boolean :on_sale, default: false
      t.belongs_to :designer

      t.timestamps null: false
    end
  end
end

class AddSubstrateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :substrate, :string
  end
end

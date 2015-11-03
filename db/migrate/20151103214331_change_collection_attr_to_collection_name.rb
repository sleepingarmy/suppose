class ChangeCollectionAttrToCollectionName < ActiveRecord::Migration
  def change
    rename_column :products, :collection, :collection_name
  end
end

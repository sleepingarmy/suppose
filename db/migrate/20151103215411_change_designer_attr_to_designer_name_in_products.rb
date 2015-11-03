class ChangeDesignerAttrToDesignerNameInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :designer, :designer_name
  end
end

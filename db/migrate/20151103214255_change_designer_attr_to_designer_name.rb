class ChangeDesignerAttrToDesignerName < ActiveRecord::Migration
  def change
    rename_column :collections, :designer, :designer_name
  end
end

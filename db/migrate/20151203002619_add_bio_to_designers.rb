class AddBioToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :bio, :text
  end
end

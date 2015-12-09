class AddStyleToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :style, :string
  end
end

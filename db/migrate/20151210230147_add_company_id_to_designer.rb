class AddCompanyIdToDesigner < ActiveRecord::Migration
  def change
    add_column :designers, :company_id, :integer
  end
end

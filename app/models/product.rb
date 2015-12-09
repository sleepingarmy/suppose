class Product < ActiveRecord::Base
  belongs_to :collection

  def self.by_name
    order(:name)
  end
end

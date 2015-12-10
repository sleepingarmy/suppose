class Product < ActiveRecord::Base
  belongs_to :collection

  def self.by_name
    order(:name)
  end

  def collection
    Collection.find(self.collection_id)
  end

  def designer
    Designer.find(Collection.find(self.collection_id).designer_id)
  end
end

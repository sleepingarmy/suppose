class Product < ActiveRecord::Base
  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>" }, default_url: "images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :price, presence: true

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

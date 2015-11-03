class Collection < ActiveRecord::Base
  belongs_to :designer
  has_many :products
end

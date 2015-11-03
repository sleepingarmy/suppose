class Collection < ActiveRecord::Base
  belongs_to :designer
  has_many :products

  # get designer name and assign it to variable?  for collection form
  def designers
    designers = Designer.all
    designers.each do |designer|
      designer = designer.name
    end
  end

  def get_designer(collection)
    Designer.find(collection.designer_id).name
  end
end

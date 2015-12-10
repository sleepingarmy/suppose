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

  def designer
    Designer.find(self.designer_id)
  end

  def self.by_name
    order(:name)
  end

  def self.by_date
    # these should also be limited somehow
    order(:created_at)
  end
end

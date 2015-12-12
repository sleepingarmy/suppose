class Designer < ActiveRecord::Base
  has_many :collections
  belongs_to :company

  def self.by_name
    order(:name)
  end

  def company
    if self.company_id
      Company.find(self.company_id)
    end
  end
end

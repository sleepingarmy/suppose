class Designer < ActiveRecord::Base
  has_many :collections
  belongs_to :company

  validates :name, presence: true
  validates :company_id, presence: true

  def self.by_name
    order(:name)
  end

  def company
    if self.company_id
      return Company.find(self.company_id)
    else
      return 'no company found'
    end
  end
end

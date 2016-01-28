class Company < ActiveRecord::Base
  has_many :designers

  validates :name, presence: true

  def self.by_name
    order(:name)
  end
end

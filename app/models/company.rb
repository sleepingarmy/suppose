class Company < ActiveRecord::Base
  has_many :designers

  def self.by_name
    order(:name)
  end
end

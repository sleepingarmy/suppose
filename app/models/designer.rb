class Designer < ActiveRecord::Base
  has_many :collections

  def self.by_name
    order(:name)
  end
end

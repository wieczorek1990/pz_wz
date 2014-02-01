class Commodity < ActiveRecord::Base
  validates :name, presence: true
end

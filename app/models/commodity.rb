class Commodity < ActiveRecord::Base
  resourcify
  validates :name, presence: true
end

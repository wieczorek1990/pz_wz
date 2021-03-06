class Supplier < ActiveRecord::Base
  resourcify
  self.per_page = 10
  validates :first_name, presence: true
  validates :last_name, presence: true
  def description
    self.last_name + ' ' + self.first_name + "\n" + self.from
  end
end

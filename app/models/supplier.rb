class Supplier < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  def description
    self.last_name + ' ' + self.first_name + "\n" + self.from
  end
end

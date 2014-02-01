class MagazineDocument < ActiveRecord::Base
  resourcify
  TYPES = ['PZ', 'WZ']
  belongs_to :supplier
  belongs_to :commodity
  validates :supplier_id, presence: true
  validates :commodity_id, presence: true
  validates :quanity, numericality: { :greater_than => 0}
  validates :current_number, numericality: { :greater_than => 0}
  validates :humidity, numericality: { :greater_than_or_equal_to => 0}
  validates :contamination, numericality: { :greater_than_or_equal_to => 0}
  validates :document_type, inclusion: { in:  TYPES}
  after_commit :create_image

  private
  def create_image
    ImageWorker.perform_async(self.id)
  end
end

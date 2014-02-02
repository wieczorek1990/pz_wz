class MagazineDocument < ActiveRecord::Base
  resourcify
  TYPES = ['PZ', 'WZ']
  belongs_to :supplier
  belongs_to :commodity
  validates :supplier_id, presence: true
  validates :commodity_id, presence: true
  validates :quanity_gross, numericality: { :greater_than => 0}
  validates :quanity_tare, numericality: { :greater_than => 0}
  validates :quanity_net, numericality: { :greater_than => 0}
  validates :current_number, numericality: { :greater_than => 0}
  validates :humidity, numericality: { :greater_than_or_equal_to => 0}
  validates :contamination, numericality: { :greater_than_or_equal_to => 0}
  validates :document_type, inclusion: { in:  TYPES}
  after_commit :create_pdf

  private
  def create_pdf
    PdfWorker.perform_async(self.id)
  end
end

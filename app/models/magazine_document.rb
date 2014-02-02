class MagazineDocument < ActiveRecord::Base
  resourcify
  self.per_page = 10
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
    PdfWriter.new(Rails.root.join('public', 'pdf', self.id.to_s + '.pdf'),
                  Rails.root.join('public', 'templates'),
                  self.supplier.description, self.commodity.name,
                  self.quanity_gross.to_s, self.quanity_tare.to_s,
                  self.quanity_net.to_s, self.date.to_formatted_s(:num),
                  self.current_number.to_s, self.humidity.to_s('F'),
                  self.contamination.to_s('f'), self.document_type,
                  self.vehicle_number).write
  end
end

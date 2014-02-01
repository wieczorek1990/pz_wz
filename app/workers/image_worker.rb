class ImageWorker
  include Sidekiq::Worker

  def perform(magazine_document_id)
    md = MagazineDocument.find(magazine_document_id)
    MagazineDocumentWriter.new(Rails.root.join('public', 'images', md.id.to_s + '.png'),
                               Rails.root.join('public', 'templates'),
                               md.supplier.description, md.commodity.name,
                               md.quanity.to_s, md.date.to_formatted_s(:num),
                               md.current_number.to_s, md.humidity.to_s('F'),
                               md.contamination.to_s('f'), md.document_type,
                               md.vehicle_number, md.symbol_of_evidence,
                               md.prof_of_delivery, md.no, md.destination).write
  end
end
json.array!(@magazine_documents) do |magazine_document|
  json.extract! magazine_document, :id, :supplier_id, :commodity_id, :quanity, :date, :current_number, :humidity, :contamination, :type, :vehicle_number, :symbol_of_evidence, :prof_of_delivery, :no, :destination
  json.url magazine_document_url(magazine_document, format: :json)
end

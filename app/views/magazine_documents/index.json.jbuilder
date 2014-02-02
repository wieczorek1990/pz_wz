json.array!(@magazine_documents) do |magazine_document|
  json.extract! magazine_document, :id, :supplier_id, :commodity_id, :quanity_gross, :quanity_tare, :quanity_net, :date, :current_number, :humidity, :contamination, :document_type, :vehicle_number
  json.url magazine_document_url(magazine_document, format: :json)
end

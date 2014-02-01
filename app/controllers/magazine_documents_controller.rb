class MagazineDocumentsController < InheritedResources::Base
  load_and_authorize_resource

  def permitted_params
    params.permit(magazine_document: [:supplier_id, :commodity_id, :quanity, :date, :current_number, :humidity, :contamination, :document_type, :vehicle_number, :symbol_of_evidence, :prof_of_delivery, :number, :destination])
  end
end

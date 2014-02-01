class MagazineDocumentsController < InheritedResources::Base
  def permitted_params
    params.permit(magazine_document: [:supplier_id, :commodity_id, :quanity, :date, :current_number, :humidity, :contamination, :type, :vehicle_number, :symbol_of_evidence, :prof_of_delivery, :no, :destination])
  end
end

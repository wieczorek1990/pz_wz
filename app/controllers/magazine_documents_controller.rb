class MagazineDocumentsController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @magazine_documents = MagazineDocument.page(params[:page]).order('created_at DESC')
  end

  def permitted_params
    params.permit(magazine_document: [:supplier_id, :commodity_id, :quanity_gross, :quanity_tare, :quanity_net, :date, :current_number, :humidity, :contamination, :document_type, :vehicle_number])
  end
end

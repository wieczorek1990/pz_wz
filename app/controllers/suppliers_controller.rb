class SuppliersController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @suppliers = Supplier.page(params[:page]).order('last_name ASC')
  end

  def permitted_params
    params.permit(supplier: [:first_name, :last_name, :from])
  end
end

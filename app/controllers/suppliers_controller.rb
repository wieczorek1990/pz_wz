class SuppliersController < InheritedResources::Base
  def permitted_params
    params.permit(supplier: [:first_name, :last_name, :from])
  end
end

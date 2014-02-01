class CommoditiesController < InheritedResources::Base
  def permitted_params
    params.permit(commodity: [:name])
  end
end

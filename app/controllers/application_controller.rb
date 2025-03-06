class ApplicationController < ActionController::API
  private

  def set_resource(service, id_param, instance_var_name)
    if params[id_param].blank?
      return render json: { error: "#{instance_var_name.to_s.capitalize} ID is required" }, status: :unprocessable_entity
    end
    
    resource = service.find_by(id: params[id_param])
    
    if resource.nil?
      render json: { error: "#{instance_var_name.to_s.capitalize} not found" }, status: :not_found
    else
      instance_variable_set("@#{instance_var_name}", resource)
    end
  end
end

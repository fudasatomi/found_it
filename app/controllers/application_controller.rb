class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :set_search
	  def set_search
	    @q        = Recipe.where(is_closed: false).search(params[:q])
	  end

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	  end

end

class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :set_search
	before_action :header_icon_user

	  def set_search
	    @q        = Recipe.where(is_closed: false).ransack(params[:q])
	    @recipes = @q.result(distinct: true)
	  end

	  def header_icon_user
	  	@header_icon_user = current_user
	  end

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	  end

end

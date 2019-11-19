class ApplicationController < ActionController::Base

	  before_action :configure_permitted_parameters, if: :devise_controller?
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name_first, :name_last, :name_first_kana, :name_last_kana, :postal_code, :address_prefecture,:address_city,:address_after,:phone_number,:email,:customer_id, :created_at, :updated_at])
    end

end



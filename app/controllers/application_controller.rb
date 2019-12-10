class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name_first, :name_last, :name_first_kana, :name_last_kana, :phone_number,:email,destinations_attributes:[:postal_code, :address_prefecture,:address_city,:address_after,:customer_id, :created_at, :updated_at]])
    end



    def after_sign_in_path_for(resource)
      case resource
      when Admin
        admin_products_path
      when Customer
        products_path
      end
    end

    def after_sign_in_path_for(resource)
        case resource
      when Admin
        new_admin_session_path
      when Customer
        new_customer_session_path
      end
    end

    # def after_sign_out_path_for(resource)
    #   case resource
    #   when :admin
    #     admin_session_path
    #   when :customer

    #   end
    # end
end

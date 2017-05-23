class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_cart

    def current_cart
        @current_cart ||= find_cart
    end

    private

    def find_cart
        cart = Cart.find_by(id: session[:cart_id])
        cart = Cart.create if cart.blank?
        session[:cart_id] = cart.id
        cart
    end

    def require_admin!
        unless current_user.is_admin?
            flash[:alert] = '您的權限不足'
            redirect_to root_path
        end
    end
end

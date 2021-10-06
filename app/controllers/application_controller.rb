class ApplicationController < ActionController::Base
    layout :layout_by_devise
    before_action :set_locale
    before_action :check_pagination
    protected

    def layout_by_devise
        devise_controller? ? "#{resource_class}_devise" : "application"
    end
    
    def check_pagination
        unless user_signed_in?
            params.extract!(:page)
        end
    end

    def set_locale
        if params[:locale]
            cookies[:locale] = params[:locale]
        end
        
        if cookies[:locale] && I18n.default_locale != cookies[:locale]
            I18n.default_locale = cookies[:locale]
        end
    end
end

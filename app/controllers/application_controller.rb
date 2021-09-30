class ApplicationController < ActionController::Base
    layout :layout_by_devise

    protected

    def layout_by_devise
        devise_controller? ? "#{resource_class}_devise" : "application"
    end
end

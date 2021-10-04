class UsersWController < ApplicationController
    before_action :authenticate_user!
    before_action :verify_profile
    layout 'users'

    def verify_profile
        current_user.build_user_profile if current_user.user_profile.blank?
    end
end

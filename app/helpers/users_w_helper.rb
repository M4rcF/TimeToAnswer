module UsersWHelper
    def set_color(value)
        if params[:action] == value
            "border:1px solid yellow;"
        end
    end

    def verify_profile_img
        avatar = current_user.user_profile.avatar
        avatar.attached? ? avatar : "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"
    end
end

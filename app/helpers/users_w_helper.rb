module UsersWHelper
    def set_color(value)
        if params[:action] == value
            "border:1px solid yellow;"
        end
    end

    def verify_profile_img
        avatar = current_user.user_profile.avatar
        avatar.attached? ? avatar : "https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_640.png"
    end
end

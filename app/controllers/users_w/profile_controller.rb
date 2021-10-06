class UsersW::ProfileController < UsersWController
    before_action :set_user
    before_action :set_params, only: [:update]
    before_action :verify_password, only: [:update]

    def edit 
        if @user.user_profile.blank?
            @user.build_user_profile
        end
    end

    def update
        bypass_sign_in(@user)
        if @user.update(set_params)
            redirect_to users_w_profile_path, notice: "Usuário atualizado"
        else
            render :edit
        end
    end

    private

    def set_user
      @user = User.find(current_user.id)
    end

    def set_params
        params.require(:user).permit(:email, :password, :password_confirmation, 
        user_profile_attributes: [:id, :first_name, :last_name, :adress, :birthdate, :avatar])
    end

    def verify_password
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
            params[:user].extract!(:password, :password_confirmation)
          end
    end
end

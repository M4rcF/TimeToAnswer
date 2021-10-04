class UsersW::WelcomeController < UsersWController
  def index
    @user = User.find(current_user.id)
  end
end

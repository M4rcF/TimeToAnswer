class UsersW::WelcomeController < UsersWController
  before_action :set_statistic
  def index
  end

  def update
    @statistic.right_questions = 0
    @statistic.wrong_questions = 0
    @statistic.save
    redirect_to users_w_welcome_index_path
  end

  private

  def set_statistic
    @statistic = UserStatistic.find(current_user.id)
  end
end

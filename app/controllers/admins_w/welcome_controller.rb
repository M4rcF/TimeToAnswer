class AdminsW::WelcomeController < AdminsWController
  def index
    @statistic_u = AdminStatistic.find_by_event("User_cont").value
    @statistic_q = AdminStatistic.find_by_event("Question_cont").value
  end
end

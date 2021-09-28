class AdminsW::AdminsController < AdminsWController
  def index
    @admins = Admin.all
  end
end

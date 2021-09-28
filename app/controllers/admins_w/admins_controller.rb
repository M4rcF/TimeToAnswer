class AdminsW::AdminsController < AdminsWController
  before_action :set_id, only: [:edit, :update, :destroy]
  before_action :set_params, only: [:update, :create]

  def index
    @admins = Admin.all
  end

  def edit
  end

  def update
    if @admin.update(set_params)
      redirect_to admins_w_admins_path, notice: "Administrador atualizado"
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    redirect_to admins_w_admins_path
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(set_params)
    if @admin.save
      redirect_to admins_w_admins_path
    else
      render :new
    end
  end
  
  private

  def set_id
    @admin = Admin.find(params[:id])
  end

  def set_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end

class AdminsW::AdminsController < AdminsWController
  before_action :set_id, only: [:edit, :update, :destroy]
  before_action :set_params, only: [:update, :create]
  before_action :set_verify_password, only: [:update]

  def index
    @admins = Admin.all.page(params[:page]).per(5)
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
    redirect_to admins_w_admins_path, notice: "Administrador excluído"
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(set_params)
    if @admin.save
      redirect_to admins_w_admins_path, notice: "Administrador criado"
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

  def set_verify_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end

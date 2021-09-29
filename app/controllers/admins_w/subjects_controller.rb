class AdminsW::SubjectsController < AdminsWController
  before_action :set_id, only: [:edit, :update, :destroy]
  before_action :set_params, only: [:update, :create]

  def index
    @subjects = Subject.all.order(:description).page(params[:page]).per(10)
  end

  def edit
  end

  def update
    
    if @subject.update(set_params)
      redirect_to admins_w_subjects_path, notice: "Assunto/Área atualizado"
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to admins_w_subjects_path, notice: "Assunto/Área excluído"
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(set_params)
    if @subject.save
      redirect_to admins_w_subjects_path, notice: "Assunto/Área criado"
    else
      render :new
    end
  end
  
  private

  def set_id
    @subject = Subject.find(params[:id])
  end

  def set_params
    params.require(:subject).permit(:description)
  end
end

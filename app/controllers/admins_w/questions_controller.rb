class AdminsW::QuestionsController < AdminsWController
  before_action :set_id, only: [:edit, :update, :destroy]
  before_action :set_params, only: [:update, :create]
  before_action :set_options_subjects, only: [:new, :create, :update, :edit]

  def index                     #Resolve o problema n + 1
    @questions = Question.includes(:subject).all.order(:description).page(params[:page]).per(10)
  end

  def edit
  end

  def update
    
    if @question.update(set_params)
      redirect_to admins_w_questions_path, notice: "Assunto/Área atualizado"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admins_w_questions_path, notice: "Assunto/Área excluído"
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(set_params)
    if @question.save
      redirect_to admins_w_questions_path, notice: "Assunto/Área criado"
    else
      render :new
    end
  end
  
  private

  def set_id
    @question = Question.find(params[:id])
  end

  def set_params
    params.require(:question).permit(:description, :subject, answers_attributes: [:id, :description, :correct, :_destroy])
  end

  def set_options_subjects
    @subject_options = Subject.all.pluck(:description, :id)
  end
end

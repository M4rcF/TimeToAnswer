class Site::SearchController < SiteController
    def questions
        @questions = Question.includes(:answers, :subject).where("lower(description) LIKE ? ", "%#{params[:explore].downcase}%").page(params[:page]).per(10)
    end

    def subject
        @questions = Question.includes(:answers, :subject).where(subject_id: params[:subject_id]).page(params[:page]).per(10)
    end
end

class Site::AnswerController < SiteController
    def question
        @answer = Answer.find(params[:answer_id])
        if user_signed_in?
            statistic = UserStatistic.find_or_create_by(user: current_user)
            @answer.correct ? statistic.right_questions += 1 : statistic.wrong_questions += 1
            statistic.save
        end
    end
end

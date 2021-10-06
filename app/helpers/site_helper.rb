module SiteHelper
    def set_msg
        case params[:action]
        when 'index'
            if cookies[:locale] == 'pt-BR'
                "Perguntas cadastradas"
            else  
                "All questions"
            end  
        when 'questions'
            if cookies[:locale] == 'pt-BR'
                "Resultados de \"#{params[:explore]}\""
            else  
                "Research results: \"#{params[:explore]}\""
            end  
        when 'subject'
            if cookies[:locale] == 'pt-BR'
                "Questões relacionadas: \"#{params[:subject_description]}\""
            else  
                "Questions related: \"#{params[:subject_description]}\" "
            end  
        end
    end
end

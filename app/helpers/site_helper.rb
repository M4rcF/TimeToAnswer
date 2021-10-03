module SiteHelper
    def set_msg
        case params[:action]
        when 'index'
            "Perguntas cadastradas"    
        when 'questions'
            "Resultados de \"#{params[:explore]}\""
        when 'subject'
            "Questões relacionadas: \"#{params[:subject_description]}\""
        end
    end
end

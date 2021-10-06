module AdminsW::QuestionsHelper
    def set_name(name)
        Question.human_attribute_name(name)
    end
end

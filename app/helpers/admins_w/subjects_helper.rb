module AdminsW::SubjectsHelper
    def set_name(name)
        Subject.human_attribute_name(name)
    end
end

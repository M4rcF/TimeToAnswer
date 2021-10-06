module AdminsW::AdminsHelper
    def set_name(name)
        Admin.human_attribute_name(name)
    end
end

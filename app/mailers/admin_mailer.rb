class AdminMailer < ApplicationMailer
    def update_email(admin, admin_u)
        @admin = admin
        @admin_u = admin_u
        mail(to: @admin_u.email, subject: "Admin updated")
    end
end

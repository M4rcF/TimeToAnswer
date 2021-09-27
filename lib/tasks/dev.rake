namespace :dev do
  desc "Configura o ambiente"
  task setup: :environment do
    DEFAULT_PASSWORD = 123456
    db:drop:_unsafe
    db:create
    db:migrate
    Admin.create!(
      email: "admin@admin",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
    puts "Admin created"
    User.create!(
      email: "user@user",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
    puts "User created"
  end

end

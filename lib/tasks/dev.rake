namespace :dev do
  desc "Configura o ambiente"
  task setup: :environment do
    DEFAULT_PASSWORD = 123456
    %x( rails db:drop:_unsafe )
    %x( rails db:create )
    %x( rails db:migrate )  
    
    Admin.create!(
      email: "admin@admin",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
    puts "Default admin created"
    User.create!(
      email: "user@user",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
    puts "User created"
    %x( rails dev:admin_fake ) 
  end
  # Faker
  desc "Configura o ambiente"
  task admin_fake: :environment do
    10.times do
      fake_password = Faker::Number.number(digits: 6)
      Admin.create!(
        email: Faker::Internet.email,
        password: fake_password,
        password_confirmation: fake_password
      )
      puts "Fake admin created"
    end
  end
end

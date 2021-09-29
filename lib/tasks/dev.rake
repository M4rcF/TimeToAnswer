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
    %x( rails dev:add_subjects )
    puts "Subjects created" 
    %x( rails dev:add_questions ) 
    puts "Questions created"
  end
  # Faker
  desc "Cadastra administradores com informações falsas"
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
  # Subjects
  desc "Cadastra asssuntos"
  task add_subjects: :environment do
    DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')
    file_name = "subjects.txt"
    file_path = File.join(DEFAULT_FILES_PATH, file_name)
    File.open(file_path, "r").each do |line|
        Subject.create!(description: line.strip)
    end
  end
   # Questions
   desc "Cadastra questões"
   task add_questions: :environment do
     Subject.all.each do |subject|
        rand(3..5).times do 
          Question.create!(
            description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
            subject: subject
          )
        end
     end
   end
end

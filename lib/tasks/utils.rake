namespace :utils do

  desc "Cria administradores fake"
  task generate_admins: :environment do
    puts "Cadastrando ADMINISTRADORES..."
    10.times do
      Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    role: [0,0,1,1,1].sample,
                    password: "123456",
                    password_confirmation: "123456")
    end
    puts "ADMINISTRADORES cadastrados com sucesso!"
  end

end

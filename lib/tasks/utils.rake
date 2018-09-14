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


  desc "Cria anúncios fake"
  task generate_ads: :environment do
    puts "Cadastrando ADS..."
    100.times do
      Ad.create!(title: Faker::Lorem.sentence([2,3,4,5].sample),
                 description: LeroleroGenerator.paragraph(Random.rand(3)),
                 member: Member.all.sample,
                 category: Category.all.sample,
                 price: "#{Random.rand(500)},#{Random.rand(99)}")
    end
    puts "ADS cadastrados com sucesso!"
  end

end

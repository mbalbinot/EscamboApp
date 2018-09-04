# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando CATEGORIAS..."
categories = ['Imóveis',
              'Autos e Peças',
              'Para sua casa',
              'Eletrônicos e Celulares',
              'Música e Hobbies',
              'Esportes e Lazer',
              'Artigos infantis',
              'Animais de estimação',
              'Moda e Beleza',
              'Agro e Indústria',
              'Comércio e Escritório',
              'Vagas de emprego'];

categories.each do |category|
  Category.find_or_create_by(description: category)
end
puts "CATEGORIAS cadastradas com sucesso!"


puts "Cadastrando ADMINISTRADOR padrão..."
Admin.create!(name: "Administrador padrão",
              email: "admin@admin.com",
              role: 0,
              password: "gringo",
              password_confirmation: "gringo")
puts "ADMINISTRADOR padrão cadastrado com sucesso!"

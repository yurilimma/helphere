# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "-----------Cadastrando categorias"
categories = [
				"Animais e Acessórios",
				"Esportes",
				"Para sua casa",
				"Eletrônicos e Celulares",
				"Música e Hobbies",
				"Moda e Beleza",
				"Veículos e Barcos",
				"Imóveis"
				]
categories.each do |category|
	Category.friendly.find_or_create_by!(description:category)
end
puts "-----------Categorias Cadastradas com sucesso!!"

puts "-----------Cadastrando Administrador ROOT!!"
Admin.create!(	name: "root",
				email: "admin@admin.com", 
			 	password: "123456", 
			    password_confirmation: "123456",
			    role: 0)


puts "-----------Administrador ROOT Cadastrado com sucesso!!"

puts "-----------Cadastrando Membro ROOT!!"
	member =Member.new(	
				email: "member@member.com", 
			 	password: "123456", 
			    password_confirmation: "123456"
			    )
	member.build_profile_member
	member.profile_member.first_name = Faker::Name.first_name
	member.profile_member.phone = "21 96925-8880"
	member.profile_member.state = "full_access"
	member.save!

puts "-----------Membro ROOT Cadastrado com sucesso!!"
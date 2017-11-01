namespace :dev do 

	desc "Executando setup desenvolvimento"
	task setup: :environment do
		puts "APAGANDO BD... #{%x(rake db:drop)}"
		puts "CRIANDO BD... #{%x(rake db:create)}"
		puts %x(rake db:migrate)
		puts %x(rake db:seed)
		puts %x(rake dev:generate_admins)
		puts %x(rake dev:generate_members)
		puts %x(rake dev:generate_ads)
		puts %x(rake dev:generate_comments)
		puts "Setup completado com sucesso!"
	end


	
	desc "Cria Administradores Fake"
	task generate_admins: :environment do
		puts "Cadastrando Administradores..."

		10.times do
			Admin.create!(
				name: Faker::Name.name,
				email: Faker::Internet.email,
				password: "123456",
				password_confirmation: "123456",
				role: 1
				)
		end
		puts "Administradores cadastrados com sucesso!"
	end


	desc "Cria Anuncios Fake"
	task generate_ads: :environment do
		puts "Cadastrando ANUNCIOS..."

	20.times do
		Ad.create!(
			title: Faker::Lorem.sentence([2,3,4,5].sample),
			description: markdown_fake,
			description_short: Faker::Lorem.sentence([2,3,4,5].sample),
			member: Member.find(1),
			category: Category.all.sample,
			price: "#{Random.rand(500)},#{Random.rand(99)}",
			finish_date: Date.today + Random.rand(90)
			)
		end
	puts "Anuncios cadastrados com sucesso!"
	end
	
	def markdown_fake
		%x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry")
		
	end

	desc "Cria Membros Fake"
	task generate_members: :environment do
		puts "Cadastrando Membros..."

		10.times do
			member =Member.new(
				email: Faker::Internet.email,
				password: "123456",
				password_confirmation: "123456",
				)
			member.build_profile_member
			member.profile_member.first_name = Faker::Name.first_name
			member.profile_member.phone = "21 96925-8880"
			member.profile_member.state = "full_access"

			member.save!
		end
		puts "Membros cadastrados com sucesso!"
	end

	desc "Cria Comentarios Fake"
	task generate_comments: :environment do
		puts "Cadastrando Comentarios..."
		Ad.all.each do |anuncio| 
			(Random.rand(3)).times do
				Comment.create!(
					body: Faker::Lorem.paragraph([1,2,3].sample),
					member: Member.all.sample,
					ad: anuncio
					)
			end
		end
		puts "Comentarios cadastrados com sucesso!"
	end

end
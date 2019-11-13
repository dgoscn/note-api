namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Cadastrando tipo de contratos... "

    contacts = %w(Amigo Comercial Conhecido)

    contacts.each do |kind| 
      Kind.create!(
        description: kind
      )
    end

    ###################################

    puts "Cadastrando os contratos..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Contratos cadastrados com sucesso..."

    ######################################

    puts "CABO"
  end
end



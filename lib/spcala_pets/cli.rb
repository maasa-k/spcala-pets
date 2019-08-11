class CLI

    def call

        puts 
        puts "Welcome, animal lover! Friendly furry friends await you and can't wait to be taken into a loving home.  Come check them out!".green 
        puts

        Scraper.scrape_pets

        input = ""
        until input == "exit"
                   
            puts "Please enter 'list pets' to see who is adoptable.".blue
            puts "To leave, please type 'exit'.".red

        input = gets.chomp
        
        case input 
            when "list pets"
                list_pets
                select_pet
            end
        end
    end

    def list_pets

        Pet.all.each.with_index(1) do |pet, index|
            puts "#{index}. #{pet.id}".light_blue
    end

    def select_pet
        puts
        puts "Please enter the number to the left of the potential adoptee you would consider:".blue

        input = gets.chomp

        pet = Pet.all[input.to_i - 1]

        Scraper.scrape_pet_info(pet)
        puts
        puts "You chose #{pet.name}! Here's some information:".green
        puts
        puts "Breed: #{pet.breed}".green
        puts "Color: #{pet.color}".green
        puts "Gender: #{pet.gender}".green
        puts
        puts "You can visit #{pet.name} in #{pet.location}!".green
        puts
        end
    end
end 
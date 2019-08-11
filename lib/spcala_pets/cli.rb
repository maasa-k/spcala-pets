class CLI

    def call

        puts ""
        puts "Welcome, animal lover! Friendly furry friends await you and can't wait to be taken into a loving home.  Come check them out!"
        puts ""

        input = ""
        until input == "exit"
                   
            puts "Please enter 'list pets' to see who is adoptable."
            puts "To leave, please type 'exit'."

        input = gets.chomp
        
        case input 
            when "list pets"
                list_pets
                select_pet
            end
        end
    end

    def list_pets
        Scraper.scrape_pets

        Pet.all.each.with_index(1) do |pet, index|
            puts "#{index}. #{pet.id}"
        end
    end

    def select_pet
        puts ""
        puts "Please enter the number to the left of the potential adoptee you would consider:"

        input = gets.chomp

        pet = Pet.all[input.to_i - 1]

        Scraper.scrape_pet_info(pet)
        puts ""
        puts "You chose #{pet.name}! Here's what we know:"
        puts ""
        puts "Breed: #{pet.breed}"
        puts "Color: #{pet.color}"
        puts "Gender: #{pet.gender}"
        puts ""
        puts "You can visit #{pet.name} in #{pet.location}!"
        puts ""
    end
end 
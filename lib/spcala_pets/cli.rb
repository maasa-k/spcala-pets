class CLI

    def call

        puts 
        puts "Welcome, animal lover! Friendly furry friends await you and can't wait to be taken into a loving home.  Come check them out!".green 
        puts

        Scraper.scrape_pets

        @input = ""
        until @input == "exit"
                   
            puts "Please enter 'list pets' to see who is adoptable.".blue
            puts "To leave, please type 'exit'.".red
            puts 

            @input = gets.chomp
            puts ""

            case @input 
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
    end

    def select_pet
        puts
        puts "Please enter the number to the left of the potential adoptee you would consider:".blue
        puts

        @input = gets.chomp.downcase

        unless @input == "exit"

            pet = Pet.all[@input.to_i - 1]

            Scraper.scrape_pet_info(pet) unless pet.scraped

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
class CLI

    def call

        puts 
        puts "Welcome, animal lover! Friendly furry friends await you and can't wait to be taken into a loving home.  Come check them out!".green 
        puts

        input = ""
        until input == "exit"
                
            puts "What type of pet are you looking for?  Please enter 'dogs', 'cats', or 'other'.".blue
            puts "To leave, please type 'exit'.".red
            puts 

            input = gets.chomp
            puts ""

            case input 
                when "dogs"
                    dog_img
                    Scraper.scrape_dogs
                    list_pets
                    select_pet
                when "cats"
                    cat_img
                    Scraper.scrape_cats
                    list_pets
                    select_pet
                when "other"
                    other_img
                    Scraper.scrape_others
                    list_pets
                    select_pet
            end
        end
    end

    def dog_img
        puts "▼・ᴥ・▼".yellow
        puts
    end

    def cat_img
        puts "ก₍⸍⸌̣ʷ̣̫⸍̣⸌₎ค".yellow
        puts
    end

    def other_img
        puts "(´･ω･`)?".yellow
        puts
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
        Pet.all.clear
    end
end 
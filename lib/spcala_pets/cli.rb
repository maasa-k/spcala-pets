class CLI

    def call
        
        puts ""
        puts "Welcome, Animal Lover! The Society for the Prevention of Cruelty to Animals Los Angeles (spcaLA) has tons of furry friends who can't wait to be taken into a loving home.  Come check them out!"

        Scraper.scrape_pets

        Pet.all.each.with_index(1) do |pet, index|
            puts "#{index}. #{pet.id}"
        end

        select_pet
    end

    def select_pet
        puts ""
        puts "Please select the number to the left of the pet you want to check out:"

        input = gets.strip

        pet = Pet.all[input.to_i - 1]

        Scraper.scrape_pet_info(pet)
        puts ""
        puts "You chose #{pet.name}! Here's what we know:"
        puts ""
        puts "Breed: #{pet.breed}"
        puts "Color: #{pet.color}"
        puts "Gender: #{pet.gender}"
        puts ""
        puts "#{pet.name} can be picked up in #{pet.location}."
        select_pet
    end
end 
class CLI

    def call
        pet_names = []
        puts ""
        puts "Welcome, Animal Lover! The Society for the Prevention of Cruelty to Animals Los Angeles (spcaLA) has tons of furry friends who can't wait to be taken into a loving home.  Come check them out!"

        html = open("https://spcala.com/adoptable/")

        doc = Nokogiri::HTML(html)

        doc.css("#adoptList ul li h4")[2..184].each do |pet|        
            name = pet.text
            pet_names << name
        end

        pet_names.each.with_index(1) do |name, index|
            puts "#{index}. #{name}"
        end
    end
end 
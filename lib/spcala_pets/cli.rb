class CLI

    def call
        
        puts ""
        puts "Welcome, Animal Lover! The Society for the Prevention of Cruelty to Animals Los Angeles (spcaLA) has tons of furry friends who can't wait to be taken into a loving home.  Come check them out!"

        html = open("https://spcala.com/adoptable/")

        doc = Nokogiri::HTML(html)

        doc.css("#adoptList ul li h4")[2..184].each do |pet|        
            name = pet.text
            
            Pet.new(name)
        end

        Pet.all.each.with_index(1) do |pet, index|
            puts "#{index}. #{pet.name}"
        end
    end
end 
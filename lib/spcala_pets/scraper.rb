class Scraper

    PETS_URL = "https://spcala.com/adoptable/"

    def self.scrape_pets
        html = open("https://spcala.com/adoptable/")

        doc = Nokogiri::HTML(html)

        doc.css("#adoptList ul li")[2..184].each do |pet| 
            name = pet.css("h4").text
            url = pet.css("a").attr("href").value
            Pet.new(name, url)
        end
    end

    def self.scrape_pet_info(pet)
        html = open(PETS_URL + pet.url)
        doc = Nokogiri::HTML(html)

        binding.pry
    end 
end
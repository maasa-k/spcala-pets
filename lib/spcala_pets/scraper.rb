class Scraper

    PETS_URL = "https://spcala.com/adoptable/"

    def self.scrape_pets
        html = open("https://spcala.com/adoptable/")

        doc = Nokogiri::HTML(html)

        doc.css("#adoptList ul li")[2..184].each do |pet| 
            id = pet.css("h4").text
            url = pet.css("a").attr("href").value
            Pet.new(id, url)
        end
    end

    def self.scrape_pet_info(pet)
        html = open(PETS_URL + pet.url)
        doc = Nokogiri::HTML(html)
        pet.name = doc.css(".spcala-pet_name").text
        pet.breed = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[1].text.strip
        pet.color = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[2].text.strip
        pet.gender = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[3].text.strip
        pet.location = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[6].text.strip
    end 
end
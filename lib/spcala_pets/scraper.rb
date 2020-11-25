class Scraper

    PETS_URL = "https://spcala.com/adoptable/"

    DOGS_URL = "https://spcala.com/adoptable/?type=Dog"
    CATS_URL = "https://spcala.com/adoptable/?type=Cat"
    OTHERS_URL = "https://spcala.com/adoptable/?type=Rabbit"

    def self.scrape_dogs
        html = open(DOGS_URL)
        
        doc = Nokogiri::HTML(html)
        
        doc.css("#adoptList ul li").each do |dog| 
        id = dog.css("h4").first.text
        url = dog.css("a").attr("href").value
        Pet.new(id, url)
        end
    end

    def self.scrape_cats
        html = open(CATS_URL)

        doc = Nokogiri::HTML(html)

        doc.css("#adoptList ul li").each do |cat| 
        id = cat.css("h4").first.text
        url = cat.css("a").attr("href").value
        Pet.new(id, url)
        end
    end

    def self.scrape_others
        html = open(OTHERS_URL)
        doc = Nokogiri::HTML(html)
        doc.css("#adoptList ul li").each do |other| 
            id = other.css("h4").first.text
            url = other.css("a").attr("href").value
            Pet.new(id, url)
        end
    end

    def self.scrape_pet_info(pet)
        pet.scraped = true
        html = open(PETS_URL + pet.url)
        doc = Nokogiri::HTML(html)
        pet.name = doc.css(".spcala-pet_name").text
        pet.breed = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[1].text.strip
        pet.color = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[2].text.strip
        pet.gender = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[3].text.strip
        pet.location = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[6].text.strip
    end  
end
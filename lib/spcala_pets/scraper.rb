class Scraper

    # PETS_URL = "https://spcala.com/adoptable/"

    # PETS_URL = "https://spcala.com/adoptable/?type="
    DOGS_URL = "https://spcala.com/adoptable/?type=Dog"
    CATS_URL = "https://spcala.com/adoptable/?type=Cat"

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
    
    # def self.scrape_pets
    #     html = open("https://spcala.com/adoptable/")

    #     doc = Nokogiri::HTML(html)

    #     doc.css("#adoptList ul li").each do |pet| 
    #         id = pet.css("h4").text
    #         url = pet.css("a").attr("href").value
    #         Pet.new(id, url)
    #     end
    # end

    def self.scrape_dog_info(pet)
        pet.scraped = true
        html = open(DOGS_URL + pet.url)
        # html = open(PETS_URL + pet.url)
        doc = Nokogiri::HTML(html)
        pet.name = doc.css(".spcala-pet_name").text
        pet.breed = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[1].text.strip
        pet.color = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[2].text.strip
        pet.gender = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[3].text.strip
        pet.location = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[6].text.strip
    end 

    def self.scrape_cat_info(pet)
        pet.scraped = true
        html = open(CATS_URL + pet.url)
        # html = open(PETS_URL + pet.url)
        doc = Nokogiri::HTML(html)
        pet.name = doc.css(".spcala-pet_name").text
        pet.breed = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[1].text.strip
        pet.color = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[2].text.strip
        pet.gender = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[3].text.strip
        pet.location = doc.css("#spcala-pet_info ul li .spcala-pet_info_right")[6].text.strip
    end 
end
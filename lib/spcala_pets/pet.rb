class Pet
    attr_accessor :id, :url, :name, :breed, :color, :gender, :location, :scraped

    @@all = []

    def initialize(id, url)
        @id = id
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end
end 
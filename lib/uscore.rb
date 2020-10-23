class Uscore

    @@all = []

    attr_accessor :number

    def initialize(number)
        @number = number
        @@all << self
    end

    def games
        Game.all.select {|game| game.uscore == self}
    end

    def self.find_or_create_by_number(number)
        found_uscore = self.all.find {|uscore| uscore.number == number}
        if found_uscore
            return found_uscore
        else
            return self.new(number)
        end
    end

    def self.all
        @@all
    end
    
end


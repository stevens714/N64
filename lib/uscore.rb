class Uscore

    @@all = []
    @@all_eight_plus = []
    @@all_under_eight = []

    attr_accessor :number, :name

    def initialize(number, name)
        @number = number
        @name = name
        @@all << self
    end

    def self.sort_uscore
        var = @@all.sort_by{|score| [score.number]}.reverse
        var.each do |score|
            if score.number >= 8
                @@all_eight_plus << score
            else
                @@all_under_eight << score
            end
        end
        
    end

    def games
        Game.all.select {|game| game.uscore == self}
    end


    def self.all
        @@all
    end

    def self.all_eight_plus
        @@all_eight_plus
    end

    def self.all_under_eight
        @@all_under_eight
    end
    
end


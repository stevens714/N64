class Game
    
    @@all = []

    attr_accessor :name, :release_date, :meta_score, :uscore, :number, :summary, :user_review, :game, :game_url, :critic_first, :critic_second, :critic_third

    def initialize(name, release_date, meta_score, uscore, summary, game_url)

        @name = name
        @release_date = release_date
        @meta_score = meta_score
        @uscore = uscore
        @summary = summary
        @game_url = game_url
        @@all << self
    end

    def self.all
        @@all
    end


    def print_game_release_meta
        puts "#{@name} released on #{@release_date} with Metacriting Rating of #{@meta_score}"
    end


    def self.print_all_games_to_be_selected
        @@all.each.with_index do |game, index| 
            puts "Game #{index + 1}. ======================"
            game.print_game_release_meta
            puts ""
        end
    end

    def self.game_over_eight
        over_eight = Game.all.select{|game| game.uscore.number >= 8}
        over_eight.each.with_index do |game, index|
            puts "Game #{index + 1}. ======================="
            game.print_game_release_meta
            puts ""
        end
    end

    def self.game_under_eight
        under_eight = Game.all.select{|game| game.uscore.number < 8}
        under_eight.each.with_index do |game, index|
            puts "Game #{index + 1}. ======================="
            game.print_game_release_meta
            puts""
        end
    end



    def print_full_game_info
            check_for_game
            puts "============================"
            sleep (1)
            self.print_game_release_meta
            puts "User Score: #{uscore.number}"
            sleep (1)
            puts "========================================="
            puts "Summary: #{@summary}"
            sleep (1)
            puts "========================================="
            puts "Critic 1: #{@critic_first}"
            sleep (1)
            puts "========================================="
            sleep (1)
            puts "Critic 2: #{@critic_second}"
            sleep (1)
            puts "=============================================="
            puts "Critic 3: #{@critic_third}"
            sleep (1)
            puts "=============================================="
            puts "Top User Review: #{@user_review}"
            puts " "
            puts @game
    end

    def check_for_game
        if @game === nil
            hash = Scraper.new.second_scrape(@game_url)
            @game = hash[:review]
            @user_review = hash[:user_review]
            @critic_first = hash[:critic_first]
            @critic_second = hash[:critic_second]
            @critic_third = hash[:critic_third]
        end
    end
end
  



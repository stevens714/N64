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

    def self.loopey
        sleep(5)
        puts "I hope you have enjoyed your time travel experience!"
        sleep(2)
        puts "Please select from the following options:"
        sleep(1)
        puts "Enter 1 to view games with a user rating of 8 or greater"
        sleep(1)
        puts "Enter 2 to view games with a user rating under 8"
        sleep(1)
        puts "Enter 3 to exit the application"
    puts "Enter 1, 2, 3"
    user_input = gets.chomp

        if user_input == "1"
            self.game_over_eight
            puts "Enter a number 1-47 to view more details about that game!"
            game_select = gets.chomp
            select_to_index = game_select.to_i - 1
            Game.game_over_eight[select_to_index].print_full_game_info
            self.loopey

        elsif user_input == "2"
            self.game_under_eight
            puts "Enter a number 1-24 to view more details about that game!"
            game_select = gets.chomp
            select_to_index = game_select.to_i - 1
            Game.game_under_eight[select_to_index].print_full_game_info
            self.loopey

        elsif user_input == "3"
            sleep(2)
            puts "Come back anytime!"

        else 
            puts "seeya later"
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
  



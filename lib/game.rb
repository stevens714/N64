class Game
    
    @@all = []

    attr_accessor :name, :release_date, :meta_score, :uscore, :summary, :user_review, :game, :game_url, :critic_first, :critic_second, :critic_third

    def initialize(name, release_date, meta_score, uscore, summary, game_url)

        # user_review,

        @name = name
        @release_date = release_date
        @meta_score = meta_score
        @uscore = uscore
        @summary = summary
        # @user_review = user_review
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
            # sleep(1)
        end
    end

    def print_full_game_info
            check_for_game
            puts "============================"
            print_game_release_meta
            puts "User Score: #{uscore.number}"
            puts "Critic 1: #{@critic_first}"
            puts "Critic 2: #{@critic_second}"
            puts "Critic 3: #{@critic_third}"
            puts " "
            puts @game
    end

    def check_for_game
        if @game === nil
            hash = Scraper.new.second_scrape(@game_url)
            @game = hash[:review]
            @critic_first = hash[:critic_first]
            @critic_second = hash[:critic_second]
            @critic_third = hash[:critic_third]
        end
    end
end
  



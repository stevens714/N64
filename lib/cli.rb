class CLI

    def run
        puts "Hi, welcome to my app"
        sleep(1)
        puts "Loading data...this might take a second!"
        Scraper.new.first_scrape
        puts "Done!"
        sleep (1)
        puts "What would you like to view?"
        sleep (1)
        puts "1. All Games"
        puts "2. Games by User Score"
        puts " "
        puts "Enter 1 or 2"
        user_input = gets.chomp
        if user_input == "1"
            Game.print_all_games_to_be_selected
            puts "Enter a number 1-71 to view that game"
            game_select = gets.chomp
            select_to_index = game_select.to_i - 1
            Game.all[select_to_index].print_full_game_info
        elsif user_input == "2"
            #write code here to display all user scores
        end
    end




end
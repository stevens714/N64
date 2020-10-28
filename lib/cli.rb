class CLI

    def run
        puts "Hello time traveler"
        sleep(2)
        puts "Today, we are going to travel back in time to visit one of the most popular video game systems of all time"
        sleep(2)
        puts "Nintendo 64!"
        sleep(2)
        puts "I have for you the top 71 Nintendo 64 games rated by Metacritic"
        sleep(2)
        puts "I am going to load them now, please hold on to your tamagotchis!"
        sleep (3)
        Scraper.new.first_scrape
        puts "Done!"
        sleep (1)
        puts "What would you like to do?"
        sleep (1)
        puts "1. View all 71 games"
        sleep (1)
        puts "2. View games with a user rating of 8 or greater"
        sleep (1)
        puts "3. View games with a user rating under 8"
        sleep (1)
        puts "4. Exit"
        sleep (1)
        puts " "
        puts "Enter 1, 2, 3, or 4"
        user_input = gets.chomp

        if user_input == "1"
            Game.print_all_games_to_be_selected
            puts "Enter a number 1-71 to view more details about that game"
            game_select = gets.chomp
            select_to_index = game_select.to_i - 1
            Game.all[select_to_index].print_full_game_info
            sleep(3)
            Game.loopey
            


        elsif user_input == "2"
            Uscore.sort_uscore
            Game.game_over_eight
            puts "Enter a number 1-47 to view more details about that game!"
            game_select = gets.chomp
            select_to_index = game_select.to_i - 1
            Game.game_over_eight[select_to_index].print_full_game_info
            sleep(3)
            Game.loopey

        elsif user_input == "3"
            Uscore.sort_uscore
            Game.game_under_eight
            puts "Enter a number 1-24 to view more details about that game!"
            game_select = gets.chomp
            select_to_index = game_select.to_i - 1
            Game.game_under_eight[select_to_index].print_full_game_info
            sleep(3)
            Game.loopey

        elsif user_input == "4"
            puts "Thanks for visiting, come back anytime!"

        else
            puts "Oops!  I think you may have pressed a wrong number!  Please try again!"
            sleep(3)
            puts "Its nice to see you again!"
            sleep(1)
            run
        end
    end




end
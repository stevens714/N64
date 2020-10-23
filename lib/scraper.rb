class Scraper
    def initialize
        @base_url = "https://www.metacritic.com"
    end

    def first_scrape
        html = (open(@base_url + "/browse/games/score/metascore/all/n64/filtered", 'User-Agent' => 'chrome'))
        html_parsed_to_elements = Nokogiri::HTML(html)
        review_games = html_parsed_to_elements.css('.clamp-summary-wrap')

   

        review_games.each do |review_games|
            name = review_games.css('h3').text
            release_date = review_games.css('.clamp-details span')[2].text
            meta_score = review_games.css('.metascore_anchor')[0].text.lstrip.chomp.rstrip
            user_score = review_games.css('.metascore_anchor')[2].text.chomp.rstrip.lstrip
            summary = review_games.css('.summary')[0].text
        
            
            game_url = review_games.css("a")[0].attr("href")

            review_hash = self.second_scrape(game_url)

            Game.new(name, release_date, meta_score, user_score, summary, review_hash[:user_review], review_hash[:critic_first], review_hash[:critic_second], review_hash[:critic_third])
            
           
        
        puts "================================================================================================================================================================"
        puts "Game: #{name}"
        puts "Release Date: #{release_date}"
        puts "Metacritic Rating: #{meta_score}"
        puts "User Rating: #{user_score}"
        puts "Game Summary:  #{summary}"
        puts "================================================================================================================================================================"
        puts "User Review: #{review_hash[:user_review]}"
        puts "First Critic Review: #{review_hash[:critic_first]}"
        puts "Second Critic Review: #{review_hash[:critic_second]}"
        puts "Third Critic Review: #{review_hash[:critic_third]}"
            
    end
end

    def second_scrape(game_url)
        game_html = open(@base_url + game_url, 'User-Agent' => 'chrome')
         
        game_html_parsed_to_elements = Nokogiri::HTML(game_html)
        
        user_review = game_html_parsed_to_elements.css(".blurb").text

        critic_first = game_html_parsed_to_elements.css('.review_section')[0].text.strip.gsub("\n", "")
        critic_second = game_html_parsed_to_elements.css('.review_section')[2].text.strip.gsub("\n", "")
        critic_third = game_html_parsed_to_elements.css('.review_section')[4].text.strip.gsub("\n", "")
        return {user_review: user_review, critic_first: critic_first, critic_second: critic_second, critic_third: critic_third}
    end

end


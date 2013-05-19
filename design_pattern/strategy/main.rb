require 'player.rb'
require 'winning_strategy.rb'
require 'probstrategy.rb'

class Main
	def Main.main
		player1 = Player.new("Taro", WinningStrategy.new)
		player2 = Player.new("Hana", ProbStrategy.new)
		
		for i in 0...10
			next_hand1 = player1.next_hand()
			next_hand2 = player2.next_hand()
			
			if (next_hand1.is_stronger_than(next_hand2) == true)
				puts "Winner:" + player1.to_string()
				player1.win()
				player2.lose()
			elsif (next_hand2.is_stronger_than(next_hand1) == true)
				puts "Winner:" + player2.to_string()
				player1.lose()
				player2.win()
			else 
				player1.even()
				player2.even()
				puts "even..."
			end
		end
		
		puts "Total result:"
		puts player1.to_string()
		puts player2.to_string()
	end
end

Main.main

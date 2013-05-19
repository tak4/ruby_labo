require 'hand.rb'
require 'strategy.rb'

class WinningStrategy < Strategy
	
	def initialize
		@won = false
	end
	
	def next_hand()
		if (@won == false)
			@prevHand = Hand.get_hand(rand(3))
		end
		return @prevHand
	end
	
	def study(win)
		@won = win
	end
end

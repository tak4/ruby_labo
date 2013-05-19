class Player
	@name
	@strategy
	@wincount
	@losecount
	@gamecount
	
	def initialize(name, strategy)
		@name = name
		@strategy = strategy
		@wincount = 0
		@losecount = 0
		@gamecount = 0
	end
	
	def next_hand()
		return @strategy.next_hand
	end
	
	def win()
		@strategy.study(true)
		@wincount += 1
		@gamecount += 1
	end
	
	def lose()
		@strategy.study(false)
		@losecount += 1
		@gamecount += 1
	end
	
	def even()
		@gamecount += 1
	end
	
	def to_string()
		return "[" + @name + ":" + @gamecount.to_s + " games, " + @wincount.to_s + " win," + @losecount.to_s + " lose]"
	end
end

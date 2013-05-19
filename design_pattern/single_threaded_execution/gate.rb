class Gate
	@counter = 0
	@name = "nobody"
	@address = "NoWhere"
	
	def pass(name, address)
		@counter++
		@name = name
		@address = address
	end
	
	def toString()
		"No." + @counter + ": " + @name + ", " + @address
	end
	
	def check()
		if @name[0] != @address[0]
			print "*** Broken *** " + toString()
		end
	end
end

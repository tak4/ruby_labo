class UserThread < Thread
	def initialize(gate, myname, myaddress)
		@gate = gate
		@myname = myname
		@myaddress = myaddress
	end
	
	
end

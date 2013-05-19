require 'number_generator.rb'

class RandomNumberGenerator < NumberGenerator
	@number

	def get_number()
		@number
	end
	
	def execute()
		for i in 0...20
			@number = rand(50)
			notify_observers()
		end
	end
end

require './observer.rb'

class DigitObserver < Observer
	def update(generator)
		puts "DigitObserver:" + generator.get_number().to_s
		sleep 0.1
	end
end

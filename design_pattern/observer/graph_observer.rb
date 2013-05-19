require './observer.rb'

class GraphObserver < Observer
	def update(generator)
		print "GraphObserver:"
		count = generator.get_number()
		for i in 0...count
			print "*"
		end
		puts
		sleep 0.1
	end
end

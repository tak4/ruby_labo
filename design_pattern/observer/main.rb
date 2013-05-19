require 'random_number_generator.rb'
require 'digit_observer.rb'
require 'graph_observer.rb'

class Main
	def Main.main()
		generator = RandomNumberGenerator.new
		observer1 = DigitObserver.new
		observer2 = GraphObserver.new
		generator.add_observer(observer1)
		generator.add_observer(observer2)
		generator.execute()
	end
end

Main.main

## abstract class
class NumberGenerator
	@observers 
	
	def initialize
		@observers = Array.new
	end
	
	def add_observer(observer)
		@observers.push(observer)
	end
	
	def delete_observer(observer)
		@observers.delete(observer)
	end
	
	def notify_observers()
		@observers.each { |observer|
			observer.update(self)
		}
	end
	
	def get_number()
		raise NotImplementedError
	end
	
	def execute()
		raise NotImplementedError
	end
end

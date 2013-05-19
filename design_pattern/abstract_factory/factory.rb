class Factory
	def Factory.get_factory(clazz)
		begin
			factory = Object.const_get(clazz).new
			return factory
		rescue NameError
			print "undefined class: #{clazz}.\n"
		end
	end
end


## abstract
class Item
	def initialize(caption)
		@caption = caption
	end
end

## abstract
class Link < Item
	def initialize(caption, url)
		super(caption)
		@url = url
	end
end

## abstract
class Tray < Item
	def initialize(caption)
		super(caption)
		@tray = Array.new
	end
	
	def add(item)
		@tray.push(item)
	end
end

## abstract
class Page
	def initialize title, author
		@title, @author = title, author
		@content = Array.new
	end
	
	def add(item)
		@content.push(item)
	end
	
	def output
		begin
			filename = @title + ".html";
			File.open(filename, "w"){ |f|
				f.write(make_HTML())
			}
			print "#{filename} was created.\n"
		rescue
			print $!
			print $@.join("\n")+"\n"
			# $! 例外オブジェクト
			# $@ スタック情報
		end
	end
	
	def make_HTML
		raise NotImplementedError
	end
end




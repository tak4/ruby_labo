class ListFactory < Factory
	def create_link(caption, url)
		ListLink.new(caption, url)
	end
	
	def create_tray(caption)
		ListTray.new(caption)
	end
	
	def create_page(title, author)
		ListPage.new(title, author)
	end
end

class ListLink < Link
	def make_HTML
		return "<li><a href=\"#{@url}\">#{@caption}</a></li>\n";
	end
end

class ListTray < Tray
	def make_HTML
		items = @tray.collect{ |item|
			"\t" + item.make_HTML
		}.join('')
		
		buffer = <<EOB
<li>
	#{@caption}
<ul>
#{items}
</ul>
</li>
EOB
		buffer
	end
end

class ListPage < Page

	def make_HTML
		items = @content.collect{ |item|
			item.make_HTML()
		}.join('')

		buffer = <<EOB
<html><head><title>#{@title}</title></head>
<body>
<h1>#{@title}</h1>
<ul>
#{items}
</ul>
<hr><address>#{@author}</address>
</body></html>
EOB
		buffer
	end
end

class TableFactory < Factory
	
	def create_link(caption, url)
		TableLink.new(caption, url)
	end
	
	def create_tray(caption)
		TableTray.new(caption)
	end
	
	def create_page(title, author)
		TablePage.new(title, author)
	end
end

class TableLink < Link
	def make_HTML
		"<td><a href=\"#{@url}\">#{@caption}</a></td>\n"
	end
end

class TableTray < Tray
	def make_HTML
		items = @tray.collect { |item|
			item.make_HTML()
		}/join('')
		
		buffer = <<EOB
<td>
<table width="100%" border="1"><tr>
<td bgcolor="#cccccc" align="center" colspan="#{@tray.size()}">
<b>#{@caption}</b>
</td>
</tr>
<tr>
#{items}
</tr>
</table>
</td>
EOB
		buffer
	end
end

class TablePage < Page
	def make_HTML
		items = @tray.collect{ |item|
			"<tr>#{item.make_HTML()}<tr>"
		}.join('')
		
		buffer = <<EOB
<html><head><title>#{@title}</title></head>
<body>
<h1>#{@title}</h1>
<table with="80%" border="3">
#{items}
</table>
<hr>
<address>#{@author}</address>
</body>
</html>
EOB
		buffer
	end
end

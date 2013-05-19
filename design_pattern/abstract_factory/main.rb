# abstract factory

require 'factory.rb'
require 'listfactory.rb'
require 'tablefactory.rb'

def usage()
	print "Usage: ruby main.rb <class name of ConcreteFactory>\n"
	print "Example 1: ruby main.rb ListFactory\n"
	print "Example 2: ruby main.rb TableFactory\n"
end

## main
if ARGV.length != 1
	usage()
	exit(0)
end

factory = Factory.get_factory(ARGV[0])

asahi    = factory.create_link("ASAHI newspaper", "http://www.asahi.com/")
yomiuri  = factory.create_link("YOMIYURI newspaper", "http://www.yomiuri.co.jp/")
us_yahoo = factory.create_link("Yahoo!", "http://www.yahoo.com/")
jp_yahoo = factory.create_link("Yahoo!Japan", "http://www.yahoo.co.jp/")
excite   = factory.create_link("Excite", "http://www.excite.com/")
google   = factory.create_link("Google", "http://www.google.com/")

traynews = factory.create_tray("Newspaper")
traynews.add(asahi)
traynews.add(yomiuri)

trayyahoo = factory.create_tray("Yahoo!")
trayyahoo.add(us_yahoo)
trayyahoo.add(jp_yahoo)

traysearch = factory.create_tray("Search Engine")
traysearch.add(trayyahoo)
traysearch.add(excite)
traysearch.add(google)

page = factory.create_page("LinkPage", "YUKI, Hiroshi")
page.add(traynews)
page.add(trayyahoo)
page.add(traysearch)

page.output()

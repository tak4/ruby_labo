a = []
x = 0
y = 0
z = 1
1.upto(100) do
	a.push(z)
	x = y
	y = z
	z = x + y
end

a.each do |i|
	puts i 
end


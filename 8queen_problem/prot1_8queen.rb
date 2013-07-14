$pos = Array.new

def _print
	print "      "
	for i in 0..2
		printf("%2d", $pos[i])
	end
	print "\n"
end

def set(i)
#	printf("set(%d) call\n", i)
	for j in 0..2
#		printf("i=%d, j=%d\n", i, j)
		$pos[i] = j
		if i == 2 then
			_print
		else
			set(i+1)
		end
	end
#	printf("set(%d) return\n", i)
end

set(0)


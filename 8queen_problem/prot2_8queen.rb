DEF_BOARD_SIZE=2
$flag = Array.new(8,0)
$pos = Array.new(8,0)

def _print
	print "      "
	for i in 0..DEF_BOARD_SIZE
		printf("%2d", $pos[i])
	end
	print "\n"
end

def set(i)
#	printf("set(%d) call\n", i)
	for j in 0..DEF_BOARD_SIZE
		if $flag[j] == 0 then
#			printf("i=%d, j=%d\n", i, j)
			$pos[i] = j
			if i == DEF_BOARD_SIZE then
				_print
			else
				$flag[j]=1
				set(i+1)
				$flag[j]=0
			end
		end
	end
#	printf("set(%d) return\n", i)
end

set(0)


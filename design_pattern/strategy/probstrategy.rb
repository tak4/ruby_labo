class ProbStrategy < Strategy

	# コンストラクタ
	def initialize
		# 前回出した手,今回出す手 => 勝ち数
		# 二次元配列をハッシュで実現する
		@history = {
			'0,0' => 1,
			'0,1' => 1,
			'0,2' => 1,
			'1,0' => 1,
			'1,1' => 1,
			'1,2' => 1,
			'2,0' => 1,
			'2,1' => 1,
			'2,2' => 1,
		}
		@current_hand_value = 0
	end
	
	def next_hand()
		# 過去の勝ち数で今回の手を決定する
		bet = rand(get_sum(@current_hand_value))
		hand_value = 0
		if (bet < @history["#{@current_hand_value},0"]) then
			hand_value = 0
		elsif (bet < @history["#{@current_hand_value},0"] + @history["#{@current_hand_value},1"]) then
			hand_value = 1
		else
			hand_value = 2
		end
		
		@prev_hand_value = @current_hand_value
		@current_hand_value = hand_value
		return Hand.get_hand(hand_value)
	end
	
	def study(win)
		if (win == true)
			# 勝ったらその手での勝ち数アップする
			@history["#{@prev_hand_value},#{@current_hand_value}"] += 1
		else
			# 負けたんだけど、勝てていた手の勝ち数アップする
			possible_to_win1 = (@current_hand_value + 1) % 3
			possible_to_win2 = (@current_hand_value + 2) % 3
			@history["#{@prev_hand_value},#{possible_to_win1}"] += 1
			@history["#{@prev_hand_value},#{possible_to_win2}"] += 1
		end
	end
	
	def get_sum(hv)
		sum = 0
		for i in 0..2
			sum += @history["#{hv},#{i}"]
		end
		return sum
	end
	
	private :get_sum
end

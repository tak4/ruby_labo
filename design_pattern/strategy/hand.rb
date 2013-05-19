# = Handクラス
# 本クラスはシングルトンです。
class Hand
	# 定数の定義
	HANDVALUE_GUU = 0
	HANDVALUE_CHO = 1
	HANDVALUE_PAA = 2
	
	# コンストラクタはプライベートです。
	private_class_method:new
	def initialize(hand_value)
		@hand_value = hand_value
		@name = [ "グー", "チョキ", "パー" ]
	end
	
	# (memo)コンストラクタより後ろに書かないとnewできない
	@@hand = [ new(HANDVALUE_GUU), new(HANDVALUE_CHO), new(HANDVALUE_PAA) ]
	
	def Hand.get_hand(hand_value)
		return @@hand[hand_value]
	end
	
	def is_stronger_than(hand)
		return fight(hand) == 1
	end
	
	def is_weeker_than(hand)
		return fight(hand) == -1
	end
	
	def fight(h)
		if (self == h)
			return 0
		elsif ((@hand_value + 1) % 3 == h.hand_value)
			return 1
		else
			return -1
		end
	end

	def to_string()
		return @name[@hand_value]
	end
	
	#公開しすぎのような気がする
	attr_accessor :hand_value
end

# debug
#puts Hand.get_hand(Hand::HANDVALUE_GUU).to_string()
#puts Hand.get_hand(Hand::HANDVALUE_CHO).to_string()
#puts Hand.get_hand(Hand::HANDVALUE_PAA).to_string()



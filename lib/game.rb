require 'board'
require 'node'

class Game
	def initialize
		@game = Board.new
	end

	def win_check(node)
		if node.right_node != nil
			true
		else
			false
		end
	end
end 


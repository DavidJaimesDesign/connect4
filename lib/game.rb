require 'board'
require 'node'
#class has been archived will no longer be part of project but will remain in the app folders

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


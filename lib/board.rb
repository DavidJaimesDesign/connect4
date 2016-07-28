class Board
	attr_accessor :board
	def initialize
		@board = [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil],
				 [nil, nil, nil, nil, nil, nil, nil]
	end

	def first_move(node, column)
		board[5][column] = node
	end

	def move(node, column)			
		if board[5][column].nil?
 			board[5][column] = node

		elsif board[4][column].nil?
			board[4][column] = node

		elsif board[3][column].nil?
			board[3][column] = node

		elsif board[2][column].nil?
			board[2][column] = node

		elsif board[1][column].nil?
			board[1][column] = node

		elsif board[0][column].nil?
			board[0][column] = node
		else
			"ERROR OUT OF BOARD RANGE"
		end
	end

	def display
		empty = "_"
		black = "\u26ab".encode('utf-8')
		white = "O" #"\u26aa".encode('utf-8')

		display_board = board.map do |row|
			row.map do |cell|
				if cell.nil?
					cell = empty

				elsif cell.is_a?(Node) && cell.color == "black"
					cell = black

				elsif cell.is_a?(Node) && cell.color == "white"
					cell = white
				end
			end
		end
		display_board.each do |row|
			row.each{|cell| print "|#{cell}|" }
			print "\n"
		end 
	end

	def sorounding_nodes(node)#A LOOP SEARCH 
		positions = {
			:center 	 => nil,
			:below  	 => "range error",
			:left   	 => nil,
			:right     	 => nil, 
			:left_lower  => "range error",
			:right_lower => "range error",
			:left_upper  => nil,
			:right_upper => nil
		}
		board.each_with_index do |v,i|
			v.each_with_index do |v0,i0|
				if v0 == node
					positions[:center] 		= "[#{i}][#{i0}]"
					positions[:below] 		= "[#{i + 1}][#{i0}]" unless ((i+1) == 6)    
					positions[:right] 		= "[#{i}][#{i0 + 1}]"
					positions[:left] 		= "[#{i}][#{i0 - 1}]"
					positions[:right_upper] = "[#{i - 1}][#{i0 + 1}]" 
					positions[:right_lower] = "[#{i + 1}][#{i0 + 1}]" unless ((i+1) == 6)  
					positions[:left_upper]  = "[#{i - 1}][#{i0 - 1}]" 
					positions[:left_lower]  = "[#{i + 1}][#{i0 - 1}]" unless ((i+1) == 6)  
				end
			end
		end	
 		return positions
	end
	def connect_nodes(node, positions) #rip the string appart and convert i to a int
		i_vert  = positions[:below]
		i0_vert = positions[:below]
		i_vert  = i_vert[1].to_i
		i0_vert = i0_vert[4].to_i

		i_left  = positions[:left]
		i0_left = positions[:left]
		i_left  = i_left[1].to_i
		i0_left = i_left[4].to_i

		i_right  = positions[:left]
		i0_right = positions[:left]
		i_right  = i_left[1].to_i
		i0_right = i_left[4].to_i

		i_right_upper  = positions[:right_upper]
		i0_right_upper = positions[:right_upper]
		i_right_upper  = i_left[1].to_i
		i0_right_upper = i_left[4].to_i

		i_left_upper  = positions[:left_upper]
		i0_left_upper = positions[:left_upper]
		i_left_upper  = i_left[1].to_i
		i0_left_upper = i_left[4].to_i

		i_left_lower  = positions[:left_lower]
		i0_left_lower = positions[:left_lower]
		i_left_lower  = i_left[1].to_i
		i0_left_lower = i_left[4].to_i

		i_right_lower  = positions[:right_lower]
		i0_right_lower = positions[:right_lower]
		i_right_lower  = i_left[1].to_i
		i0_right_lower = i_left[4].to_i

		node.add_vert( board[i_vert][i0_vert] ) unless board[i_vert][i0_vert] == nil  

		node.add_left( board[i_left][i0_left] ) unless board[i_left][i0] == nil 

		node.add_right( board[i_right][i0_right] ) unless board[][] == nil

		node.add_upper_left( board[i_left_upper][i0_left_upper] ) unless board[][] == nil

		node.add_upper_right( board[i_right_upper][i0_right_upper] ) unless board[][] == nil

		node.add_lower_left( board[i_left_lower][i0_left_lower] ) unless board[][] == nil

		node.add_lower_right( board[i_right_lower][i0_left_lower] ) unless board[][] == nil
	end
end
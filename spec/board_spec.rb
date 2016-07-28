require 'board'
require 'node'

describe Board do
	game_board = Board.new
	context "initialize" do
		it "initializes as an empty 2D array 6 arrays with 7 elements" do
			board = Board.new
			expect(board.board).to eql([[nil, nil, nil, nil, nil, nil, nil],[nil, nil, nil, nil, nil, nil, nil],[nil, nil, nil, nil, nil, nil, nil],[nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil],[nil, nil, nil, nil, nil, nil, nil]])
		end
	end

	context "adding nodes" do
		#you can actually add anything to the board. The board only displays the nodes?
		it "adds the first node to the 0 array" do
			node = Node.new
			node.color = "0"
			game_board.first_move(node, 4)
			expect(game_board.board[5][4]).to eql(node)
		end

		it "adds nodes on top of each other" do
			node1 = Node.new
			node2 = Node.new
			node1.color = "1"
			node2.color = "2"
			game_board.first_move(node1, 4)
			game_board.move(node2, 4)
			expect(game_board.board[5][4]).to eql(node1)
			expect(game_board.board[4][4]).to eql(node2)
		end
	end
	describe "#sorounding_nodes finds the indexes for the indices that sorround the node" do
		game_board2 = Board.new
		node3  = Node.new
		node4  = Node.new
		node5  = Node.new
		node6  = Node.new
		node7  = Node.new
		node8  = Node.new
		node9  = Node.new
		node10 = Node.new
		node3.color  = "4"
		node4.color  = "5"
		node5.color  = "6"
		node6.color  = "7"
		node7.color  = "8"
		node8.color  = "9"
		node9.color  = "10"
		node10.color = "11"

		game_board2.first_move(node3, 4)
		game_board2.move(node4,  4)
		game_board2.move(node5,  5)#lower_right
		game_board2.move(node6,  3)#lower_left
		game_board2.move(node7,  5)#right
		game_board2.move(node8,  3)#left
		game_board2.move(node9,  5)#upper_right
		game_board2.move(node10, 3)#upper_left

		positions = game_board2.sorounding_nodes(node4)

		describe "Finds sorrounding values" do
			it "finds the index of the node" do 
				expect(positions[:center]).to eql("[4][4]")
			end

			it "finds the node below" do
				expect(positions[:below]).to eql("[5][4]")
			end

			it "finds the lower diagonal nodes" do
				expect(positions[:right_lower]).to eql("[5][5]")
				expect(positions[:left_lower]).to  eql("[5][3]")
			end

			it "finds the horizontal nodes" do
				expect(positions[:right]).to eql("[4][5]")
				expect(positions[:left]).to  eql("[4][3]")
			end

			it "finds the upper diagonal nodes" do
				expect(positions[:right_upper]).to eql("[3][5]")
				expect(positions[:left_upper]).to  eql("[3][3]")
			end

			it "sets the lower nodes to nil if they are 'lower' then the lowest row" do
				positions2 = game_board2.sorounding_nodes(node3)
				expect(positions2[:below]).to eql(nil)
				expect(positions2[:right_lower]).to eql(nil)
				expect(positions2[:left_lower]).to eql(nil)
			end
		end
	end

	describe "#connect_nodes" do
		game_board2 = Board.new
		node3  = Node.new
		node4  = Node.new
		node5  = Node.new
		node6  = Node.new
		node7  = Node.new
		node8  = Node.new
		node9  = Node.new
		node10 = Node.new
		node3.color  = "4"
		node4.color  = "5"
		node5.color  = "6"
		node6.color  = "7"
		node7.color  = "8"
		node8.color  = "9"
		node9.color  = "10"
		node10.color = "11"

		game_board2.first_move(node3, 4)
		game_board2.move(node4,  4)
		game_board2.move(node5,  5)#lower_right
		game_board2.move(node6,  3)#lower_left
		game_board2.move(node7,  5)#right
		game_board2.move(node8,  3)#left
		game_board2.move(node9,  5)#upper_right
		game_board2.move(node10, 3)#upper_left

		positions3 = game_board2.sorounding_nodes(node4)
		game_board2.connect_nodes(node4, positions3)

		it "connects the prime node to the sorounding nodes using the sorounding_nodes" do
			expect(node4.vertical_node).to 			   eql(node3)
			expect(node4.left_node).to      		   eql(node8)
			expect(node4.right_node).to    			   eql(node7)
			expect(node4.upper_left_diagonal_node).to  eql(node10)
			expect(node4.upper_right_diagonal_node).to eql(node9)
			expect(node4.lower_left_diagonal_node).to  eql(node6)
			expect(node4.lower_right_diagonal_node).to eql(node5)
		end

		it "does not connect with nodes of different colors" do
		end

		it "does not connect not adjacent nodes" do
		end
	end

	context "displaying values" do 
		game_board_dis = Board.new

		it "can display the empty board" do
			expect{game_board_dis.display}.to output("|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n").to_stdout
		end

		it "can display whenever a node is added according to color" do 
			node1 = Node.new
			node1.color = "black"
			black = "\u26ab".encode('utf-8')
			game_board_dis.first_move(node1, 4)

			expect{game_board_dis.display}.to output("|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||_||_||_|\n|_||_||_||_||#{black}||_||_|\n").to_stdout
		end

		it "can display the current state of the game" do
			node1 = Node.new
			node2 = Node.new
			node1.color = "black"
			node2.color = "white"
			game_board.first_move(node1, 4)
			game_board.move(node2, 4)
		end
	end
end
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
			node.color = "black"
			game_board.first_move(node, 4)
			expect(game_board.board[5][4]).to eql(node)
		end

		it "adds nodes on top of each other" do
			node1 = Node.new
			node2 = Node.new
			node1.color = "black"
			node2.color = "white"
			game_board.first_move(node1, 4)
			game_board.move(node2, 4)
			expect(game_board.board[5][4]).to eql(node1)
			expect(game_board.board[4][4]).to eql(node2)
		end
	end
	describe "#connect_nodes" do
		node = Node.new
		node.color = "black"
		game_board.first_move(node, 4)
		positions = game_board.connect_nodes(node)

		it "finds the index of the node" do 
			expect(positions[:center]).to eql([0][4])
		end

		it "finds the node below" do
			expect(positions[:below]).to eql(nil)
		end

		it "finds the lower diagonal nodes" do
			expect(positions[:lower_right]).to eql(nil)
			expect(positions[:lower_left]).to eql(nil)
		end

		it "finds the horizontal nodes" do
			expect(positions[:right]).to eql(nil)
			expect(positions[:left]).to eql(nil)
		end

		it "finds the upper diagonal nodes" do
			expect(positions[:upper_right]).to eql(nil)
			expect(positions[:upper_left]).to eql(nil)
		end

		it "links the nodes of the same color together if they are adjacent" do 
			node3 = Node.new
			node4 = Node.new
			node5 = Node.new
			node5.color = "black"
			node4.color = "white"
			node5.color = "black"

			game_board.first_move(node3, 4)
			game_board.move(node4, 4)
			game_board.move(node5, 3)

			expect(node5.right_node).to eql(node3)
		end

		it "does not link nodes that are not the same color" do
		end

		it "does not link nodes that are not adjacent" do
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
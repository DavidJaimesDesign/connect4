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
			node.color = "blue"
			game_board.first_move(node, 4)
			expect(game_board.board[5][4]).to eql(node)
		end

		it "adds nodes on top of each other" do
			node1 = Node.new
			node2 = Node.new
			node1.color = "blue"
			node2.color = "red"
			game_board.first_move(node1, 4)
			game_board.move(node2, 4)
			expect(game_board.board[5][4]).to eql(node1)
			expect(game_board.board[4][4]).to eql(node2)
		end

	end

	context "displaying values" do 
		it "can display the empty board" do
			expect{game_board.display}.to output("|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n").to_stdout
		end

		it "can display whenever a node is added according to color" do 
			node1 = Node.new
			node1.color = "black"
			black = "\u26ab".encode('utf-8')
			game_board.first_move(node1, 4)

			expect{game_board.display}.to output("|_|_|_|_|#{black}|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n|_|_|_|_|_|_|_|\n").to_stdout
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
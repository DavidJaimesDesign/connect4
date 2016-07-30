require 'win_check'
require 'board'
require 'node'
#the prime node is the node that is curently being checked for victory conditions
#Question; if we are doing bi sequential addition should we do bi sequential victory check? RESEARCH THIS

describe Win_Check do
	context "new class basic tests" do
		describe "#initialize" do 
			before (:each) do
				@node  = Node.new
				@board = Board.new
			end
			it "initializes by taking in the board and the prime node" do
				node = @node
				board = @board
				victory_check = Win_Check.new(node, board)
				expect(victory_check.node).to be_a(Node)
				expect(victory_check.board).to be_a(Board)
			end

			it "can have the node values changed" do
				node = @node
				board = @board
				victory_check = Win_Check.new(node, board)
				victory_check.node.color = "Black"
				expect(victory_check.node.color).to eq("Black")
			end

			it "can see the nodes connected to the prime node" do
				node = @node
				board = @board
				node2 = Node.new
				node.color = "black"
				node2.color = "black"

				board.first_move(node, 4)
				board.move(node2, 3)
				positions = board.sorounding_nodes(node2)
				board.connect_nodes(node2, positions)

				victory_check = Win_Check.new(node2, board)
				expect(victory_check.node.right_node).to eq(node)

			end
		end
	end
	context "Testing various victory methods" do
		describe "#right_check" do
			before(:each) do
			@node0 = Node.new(color: "black")
			@node1 = Node.new(color: "black")
			@node2 = Node.new(color: "black")
			@node3 = Node.new(color: "black")

			@board = Board.new

			@board.first_move(@node0, 1)
			positions = @board.sorounding_nodes(@node0)
			@board.connect_nodes(@node0, positions)

			@board.move(@node1, 2)
			positions = @board.sorounding_nodes(@node0)
			@board.connect_nodes(@node0, positions)
			positions = @board.sorounding_nodes(@node1)
			@board.connect_nodes(@node1, positions)

			@board.move(@node2, 3)
			positions = @board.sorounding_nodes(@node1)
			@board.connect_nodes(@node1, positions)
			positions = @board.sorounding_nodes(@node2)
			@board.connect_nodes(@node2, positions)

			@board.move(@node3, 4)
			positions = @board.sorounding_nodes(@node2)
			@board.connect_nodes(@node2, positions)
			positions = @board.sorounding_nodes(@node3)
			@board.connect_nodes(@node3, positions)

			@victory_check = Win_Check.new(@node, @board)
		end

			it "checks for a win condition to the right of the prime node" do
				expect(@victory_check.right_check).to eq(true)
			end

			it "returns false for a non win condition" do
				expect(@victory_check2.right_check).to eq(false)
			end
		end

		describe "#left_check" do 
			it "checks for a win condition to the left of the prime node" do
				expect(victory_check.left_check).to be true
			end

			it "returns false for a non win condition" do
				expect(victory_check.left_check).to be false
			end
		end

		describe "#vertical_check" do
			it "checks for a vertical win condition of the prime node" do
				expect(victory_check.vertical_check).to be true 
			end

			it "returns false for a non win condition" do
				expect(victory_check2.vertical_check).to be false 
			end
		end

		describe "#right_upper_diagonal_check" do
			it "checks for a win condition in the upper right diagonal direction fo the prime node" do
				expect(victory_check.right_upper_diagonal_check).to be true 
			end

			it "returns false for a non win condition" do
				expect(victory_check2.right_upper_diagonal_check).to be false 
			end
		end

		describe "#right_lower_diagonal_check" do 
			it "checks for a win condition in the lower right diagonal direction for the prime node" do
				expect(victory_check.right_lower_diagonal_check).to be true 
			end

			it "returns false for a non win condition" do
				expect(victory_check2.right_lower_diagonal_check).to be false 
			end
		end

		describe "#left_upper_diagonal_check" do
			it "checks for a win condition in the upper left diagonal direction for the prime node" do
				expect(victory_check.left_upper_diagonal_check).to be true 
			end

			it "returns false for a non win condition" do
				expect(victory_check2.left_upper_diagonal_check).to be false 
			end
		end

		describe "#left_lower_diagonal_check" do
			it "checks for a win condition in the lower left diagonal direction for the prime node" do
				expect(victory_check.left_false_diagonal_check).to be true 				
			end

			it "returns false for a non win condition" do
				expect(victory_check2.left_false_diagonal_check).to be false 
			end
 		end
	end
end
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
			end
			it "initializes by taking in the board and the prime node" do
				victory_check = Win_Check.new(@node)
				expect(victory_check.node).to be_instance_of(Node)
			end

			it "can have the node values changed" do
				victory_check = Win_Check.new(@node)
				victory_check.node.color = "Black"
				expect(victory_check.node.color).to eq("Black")
			end

			it "can see the nodes connected to the prime node" do
				node2 = Node.new
				@node.color = "black"
				node2.color = "black"
				@node.add_right(node2)
				victory_check = Win_Check.new(@node)
				expect(victory_check.node.right_node).to eq(node2)

			end
		end
	end
	context "Testing various victory methods" do
		describe "#right_check" do
			before(:each) do
				@node0 = double('Node')
				@node1 = double('Node')
				@node2 = double('Node')
				@node3 = double('Node')

				@node0.stub(:right_node).and_return(@node1)
				@node1.stub(:right_node).and_return(@node2)
				@node2.stub(:right_node).and_return(@node3)

				@victory_check = Win_Check.new(@node0)
			end

			it "responds to #check_right method" do
				expect(@victory_check.node).to eq(@node0) 
				expect(@victory_check).to respond_to(:right_check)
				expect(@node0.right_node.right_node.right_node).to eq(@node3)
			end

			it "checks for a win condition to the right of the prime node" do
				expect(@victory_check.right_check).to eq(true)
			end

			it "returns false for a non win condition" do
				expect(@victory_check2.right_check).to eq(false)
			end
		end
	end
end
=begin
	
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

=end
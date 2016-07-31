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
				@node3.stub(:right_node).and_return(nil)

				@victory_check = Win_Check.new(@node0)
				@victory_check2 = Win_Check.new(@node1)#we will have to see how this fares when actually applied
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
	describe "#left_check" do 
		before(:each) do 
			@node0 = double('Node')
			@node1 = double('Node')
			@node2 = double('Node')
			@node3 = double('Node')

			@node0.stub(:left_node).and_return(@node1)
			@node1.stub(:left_node).and_return(@node2)
			@node2.stub(:left_node).and_return(@node3)
			@node3.stub(:left_node).and_return(nil)

			@victory_check = Win_Check.new(@node0)
			@victory_check2 = Win_Check.new(@node1)#we will have to see how this fares when actually applied
		end
		it "responds to the #left_check method" do
			expect(@victory_check.node).to eq(@node0)
			expect(@victory_check).to respond_to(:left_check)
			expect(@node0.left_node.left_node.left_node).to eq(@node3)
		end

		it "checks for a win condition to the left of the prime node" do
			expect(@victory_check.left_check).to be true
		end

		it "returns false for a non win condition" do
			expect(@victory_check2.left_check).to be false
		end
	end
	describe "#vertical_check" do
		before(:each) do 
			@node0 = double('Node')
			@node1 = double('Node')
			@node2 = double('Node')
			@node3 = double('Node')

			@node0.stub(:vertical_node).and_return(@node1)
			@node1.stub(:vertical_node).and_return(@node2)
			@node2.stub(:vertical_node).and_return(@node3)
			@node3.stub(:vertical_node).and_return(nil)
			#nodes in reverse order but it works and keeps seperate from game proc

			@victory_check = Win_Check.new(@node0)
			@victory_check2 = Win_Check.new(@node1)
		end

		it "responds to the #vertical_check method" do 
			expect(@victory_check.node).to eq(@node0)
			expect(@victory_check).to respond_to(:vertical_check)
			expect(@node0.vertical_node.vertical_node.vertical_node).to eq(@node3)
		end

		it "checks for a vertical win condition of the prime node" do
			expect(@victory_check.vertical_check).to be true 
		end

		it "returns false for a non win condition" do
			expect(@victory_check2.vertical_check).to be false 
		end
	end
	describe "#right_upper_diagonal_check" do
		before(:each) do 
			@node0 = double('Node')
			@node1 = double('Node')
			@node2 = double('Node')
			@node3 = double('Node')

			@node0.stub(:upper_right_diagonal_node).and_return(@node1)
			@node1.stub(:upper_right_diagonal_node).and_return(@node2)
			@node2.stub(:upper_right_diagonal_node).and_return(@node3)
			@node3.stub(:upper_right_diagonal_node).and_return(nil)
			#nodes in reverse order but it works and keeps seperate from game proc

			@victory_check = Win_Check.new(@node0)
			@victory_check2 = Win_Check.new(@node1)
		end
		it "responds to the #vertical_check method" do 
			expect(@victory_check.node).to eq(@node0)
			expect(@victory_check).to respond_to(:right_upper_diagonal_check)
			expect(@node0.upper_right_diagonal_node.upper_right_diagonal_node.upper_right_diagonal_node).to eq(@node3)
		end

		it "checks for a win condition in the upper right diagonal direction fo the prime node" do
			expect(@victory_check.right_upper_diagonal_check).to be true 
		end
		it "returns false for a non win condition" do
			expect(@victory_check2.right_upper_diagonal_check).to be false 
		end
	end
	describe "#right_lower_diagonal_check" do
		before(:each) do 
			@node0 = double('Node')
			@node1 = double('Node')
			@node2 = double('Node')
			@node3 = double('Node')

			@node0.stub(:lower_right_diagonal_node).and_return(@node1)
			@node1.stub(:lower_right_diagonal_node).and_return(@node2)
			@node2.stub(:lower_right_diagonal_node).and_return(@node3)
			@node3.stub(:lower_right_diagonal_node).and_return(nil)
			#nodes in reverse order but it works and keeps seperate from game proc

			@victory_check = Win_Check.new(@node0)
			@victory_check2 = Win_Check.new(@node1)
		end
		it "responds to the #vertical_check method" do 
			expect(@victory_check.node).to eq(@node0)
			expect(@victory_check).to respond_to(:right_lower_diagonal_check)
			expect(@node0.lower_right_diagonal_node.lower_right_diagonal_node.lower_right_diagonal_node).to eq(@node3)
		end
			 
		it "checks for a win condition in the lower right diagonal direction for the prime node" do
			expect(@victory_check.right_lower_diagonal_check).to be true 
		end

		it "returns false for a non win condition" do
			expect(@victory_check2.right_lower_diagonal_check).to be false 
		end
	end
	describe "#left_upper_diagonal_check" do
		before(:each) do 
			@node0 = double('Node')
			@node1 = double('Node')
			@node2 = double('Node')
			@node3 = double('Node')

			@node0.stub(:upper_left_diagonal_node).and_return(@node1)
			@node1.stub(:upper_left_diagonal_node).and_return(@node2)
			@node2.stub(:upper_left_diagonal_node).and_return(@node3)
			@node3.stub(:upper_left_diagonal_node).and_return(nil)
			#nodes in reverse order but it works and keeps seperate from game proc

			@victory_check = Win_Check.new(@node0)
			@victory_check2 = Win_Check.new(@node1)
		end
		it "responds to the #vertical_check method" do 
			expect(@victory_check.node).to eq(@node0)
			expect(@victory_check).to respond_to(:left_upper_diagonal_check)
			expect(@node0.upper_left_diagonal_node.upper_left_diagonal_node.upper_left_diagonal_node).to eq(@node3)
		end
		it "checks for a win condition in the upper left diagonal direction for the prime node" do
			expect(@victory_check.left_upper_diagonal_check).to be true 
		end

		it "returns false for a non win condition" do
			expect(@victory_check2.left_upper_diagonal_check).to be false 
		end
	end
	describe "#left_lower_diagonal_check" do
		before(:each) do 
			@node0 = double('Node')
			@node1 = double('Node')
			@node2 = double('Node')
			@node3 = double('Node')

			@node0.stub(:lower_left_diagonal_node).and_return(@node1)
			@node1.stub(:lower_left_diagonal_node).and_return(@node2)
			@node2.stub(:lower_left_diagonal_node).and_return(@node3)
			@node3.stub(:lower_left_diagonal_node).and_return(nil)
			#nodes in reverse order but it works and keeps seperate from game proc

			@victory_check = Win_Check.new(@node0)
			@victory_check2 = Win_Check.new(@node1)
		end
		it "responds to the #vertical_check method" do 
			expect(@victory_check.node).to eq(@node0)
			expect(@victory_check).to respond_to(:left_lower_diagonal_check)
			expect(@node0.lower_left_diagonal_node.lower_left_diagonal_node.lower_left_diagonal_node).to eq(@node3)
		end
		it "checks for a win condition in the lower left diagonal direction for the prime node" do
			expect(@victory_check.left_lower_diagonal_check).to be true 				
		end

		it "returns false for a non win condition" do
			expect(@victory_check2.left_lower_diagonal_check).to be false 
		end
 	end
end

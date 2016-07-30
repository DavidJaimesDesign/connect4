require 'win_check'
#the prime node is the node that is curently being checked for victory conditions
#Question; if we are doing bi sequential addition should we do bi sequential victory check? RESEARCH THIS

describe Win_Check do
	context "checking for win" do
		describe "#initialize" do 
			it "initializes by taking in the board and the prime node" do
				node  = double('Node')
				board = double('Board')

				victory_check = Win_Check.new(node, board)
			end

			it "can have the node values changed" do
			end

			it "can use the nodes stored in the board to connect" do
			end
		end

		describe "#right_check" do
			it "checks for a win condition to the right of the prime node" do
			end
		end

		describe "#left_check" do 
			it "checks for a win condition to the left of the prime node" do
			end
		end

		describe "#vertical_check" do
			it "checks for a vertical win condition of the prime node" do
			end
		end

		describe "#right_upper_diagonal_check" do
			it "checks for a win condition in the upper right diagonal direction fo the prime node" do
			end
		end

		describe "#right_lower_diagonal_check" do 
			it "checks for a win condition in the lower right diagonal direction for the prime node" do
			end
		end

		describe "#left_upper_diagonal_check" do
			it "checks for a win condition in the upper left diagonal direction for the prime node" do
			end
		end

		describe "#left_lower_diagonal_check" do
			it "checks for a win condition in the lower left diagonal direction for the prime node" do
			end
 		end
	end
end
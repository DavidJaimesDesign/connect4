require 'game'
require 'node'
require 'board'
#class has been archived will no longer be part of project but will remain in the app folders
describe Game do
	context "New Game" do
		describe "#Initialize" do
			it "Creates and empty board" do
				new_game = Game.new
				new_game.be_a(Board)
			end
		end
	end

	context "Victory Check" do 

		describe "#win_check" do
			before(:each) do
				@new_game = Game.new
				@node1    = Node.new
				@node2    = Node.new
				@node3	  = Node.new
				@node4	  = Node.new

				@node1.color = "white"
				@node2.color = "white"
				@node3.color = "white"
				@node4.color = "white"

				@new_game.board.first_move(node1, 2)
				@new_game.board.move(node2, 3)
				@new_game.board.move(node3, 4)
				@new_game.board.move(node4, 5)

				@postions = @new_game.sorrounding_nodes(node1) 
				@new_game.connect_nodes(node1, @postions)
			end

			describe "phase 1: node links discovery" do
				#returns true if the node has connected nodes
				expect(@new_game.win_check(@node1)).to be true
			end

			describe "phase 2: node links length calculation" do
				expect(@new_game.win_check(@node1)).to be 4
			end

			describe "phase 3: end game or continue" do #this could be a seperate method

			end
		end
	end
end
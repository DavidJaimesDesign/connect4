require 'game'
require 'node'
require 'board'

describe Game do
	context "New Game" do
		describe "#Initialize" do
			it "Creates and empty board" do
				new_game = Game.new
				new_game.be_a(Board)
			end
		end
	end

	context "Making moves" do
		it "cycles through the available sorrounding nodes" do 
		end

		it "it can select nodes of the same color" do
		end

		it "it adds those nodes to the new node" do
		end
	end

	context "Victory Check" do 
		describe "#game_over" do
		end

		describe "#winner" do
		end 
	end
end
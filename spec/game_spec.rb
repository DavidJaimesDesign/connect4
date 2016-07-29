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

	context "Victory Check" do 
	new_game = Game.new
	node = N
		describe "#win_check" do
			new_game.win_check(node)
			describe "pahse 1: node links discovery" do
				
			end

			describe "phase 2: node links length calculation" do
			end

			describe "phase 3: end game or continue" do #this could be a seperate method

			end
		end
	end
end
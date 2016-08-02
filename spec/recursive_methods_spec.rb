require 'recursive_methods'
require 'board'
require 'node'
require 'win_check'

describe "#recursive_connect_nodes" do
	it "connects nodes in an array using the board for coordinates" do
		node0 = Node.new(color: "white")
		node1 = Node.new(color: "white")
		node2 = Node.new(color: "white")
		node3 = Node.new(color: "white")

		board = Board.new

		board.move(node0, 3)
		board.move(node1, 4)
		board.move(node2, 1)
		board.move(node3, 2)

		nodes = [node0, node1, node2, node3]

		recursive_connect_nodes(nodes, board)

		expect(node0.right_node).to eq(node1)
		expect(node0.left_node).to  eq(node3)
		expect(node1.right_node).to eq(nil)
		expect(node1.left_node).to  eq(node0)
		expect(node2.right_node).to eq(node3)
		expect(node2.left_node).to  eq(nil)
		expect(node3.right_node).to eq(node0)
		expect(node3.left_node).to  eq(node2)
	end
end

describe "#recursive_win_check" do
	it "returns true if there is a win condition regardless of order" do
		node0 = Node.new(color: "white")
		node1 = Node.new(color: "white")
		node2 = Node.new(color: "white")
		node3 = Node.new(color: "white")

		board = Board.new

		board.move(node0, 3)
		board.move(node1, 4)
		board.move(node2, 1)
		board.move(node3, 2)

		nodes = [node0, node1, node2, node3]

		recursive_connect_nodes(nodes, board)
		expect(recursive_win_check(nodes)).to eq(true)
	end
end

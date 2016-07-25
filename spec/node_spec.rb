require 'node'

describe Node do
	node = Node.new(color: "red")
	context "initialize" do
		it "initializes with a color" do
			expect{ Node.new(color: "red") }.to_not raise_error
		end

		it "initializes with nil values for its vertical_node" do
			expect(node.vertical_node).to eql(nil)
		end

		it "initializes with nil values for its left node" do
			expect(node.left_node).to eql(nil)
		end

		it "initializes with nil values for itf right node" do
			expect(node.right_node).to eql(nil)
		end

		it "initializes with nil values for upper_right_diagonal_node" do
			expect(node.upper_right_diagonal_node).to eql(nil)
		end

		it "initializes with nil value for upper_left_diagonal_node"

		it "initializes with nil values for left_diagonal_node" do
			expect(node.left_diagonal_node).to eql(nil)
		end
	end

	context "adding a node" do
		connect_node = Node.new(color: "blue")
		it "responds when color is called" do
			expect(node.color).to eql(:color => "red")
		end

		it "can connect with a vertical_node" do
			node.add_vert(connect_node)
			expect(node.vertical_node).to eql(connect_node)
			expect(node.vertical_node.color).to eql(:color => "blue")
		end

		it "can connect with a horizontal_node" do
			node.add_left(connect_node)
			expect(node.left_node.color).to eql(:color => "blue")

			node.add_right(connect_node)
			expect(node.right_node.color).to eql(:color => "blue")
		end

		it "can connect with a right_diagonal_node and a left_diagonal_node" do
		end
	end
end
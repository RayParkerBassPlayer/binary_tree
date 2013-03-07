require "../lib/binary_tree_node"

describe BinaryTreeNode do
  it "has nil children upon creation" do
    node = BinaryTreeNode.new("")

    expect(node.left).to be nil
    expect(node.right).to be nil
  end

  context "item v. node and comparison" do
    it "properly compares two items" do
      item_a = "a"
      item_b = "a"
      node_a = BinaryTreeNode.new(item_a)
      node_b = BinaryTreeNode.new(item_b)

      expect(node_a.item).to eq node_b.item
    end

    it "properly compares two nodes" do
      item_a = "a"
      item_b = "a"
      node_a = BinaryTreeNode.new(item_a)
      node_b = BinaryTreeNode.new(item_b)

      expect(node_a).to eq node_b
    end

    it "properly compares an item and a node" do
      item_a = "a"
      item_b = "a"
      node_a = BinaryTreeNode.new(item_a)
      node_b = BinaryTreeNode.new(item_b)

      expect(node_a).to eq node_b.item
    end

    it "recognizes an item that is equal" do
      item_a = "a"
      item_b = "a"
      node = BinaryTreeNode.new(item_a)

      expect(node).to eq item_b
    end

    it "recognizes an item that is less than" do
      item_a = "a"
      item_b = "b"
      node = BinaryTreeNode.new(item_a)

      node.should < item_b
    end

    it "recognizes an item that is greater than" do
      item_a = "b"
      item_b = "a"
      node = BinaryTreeNode.new(item_a)

      node.should > item_b
    end
  end

  it "takes an item and stores it properly" do
    item = "a string"
    node = BinaryTreeNode.new(item)
    expect(node).to eq item
  end
end

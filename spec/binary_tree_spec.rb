require "../lib/binary_tree"

describe BinaryTree do
  context "empty tree" do
    it "returns nil when tree is empty" do
      tree = BinaryTree.new
      expect(tree.find("")).to be nil
    end
  end

  it "returns an item when the item exists" do
    tree = BinaryTree.new
    item = "my item"

    tree.add_item(item)
    expect(tree.find(item)).to eq item
  end

  it "returns an item when the item exists and there are many items" do
    tree = BinaryTree.new
    tree.add(5)
    10.times do |i|
      tree.add_item(i)
    end

    expect(tree.find(3)).to eq 3
  end

  it "returns nil when the item doesn't exist and there are many items" do
    tree = BinaryTree.new
    tree.add(5)
    10.times do |i|
      tree.add_item(i)
    end

    expect(tree.find(30)).to be nil
  end

  it "returns nil when the item does not exist" do
    tree = BinaryTree.new
    item = "my item"

    tree.add_item(item)
    expect(tree.find("not my item")).to be nil
  end

  it "to return an array of ordered items" do
    tree = BinaryTree.new
    items = []

    10.times.each{items << rand(100)}

    for int in items
      tree.add(int)
    end

    tree_items = tree.items
    expect(tree_items).to eq items.sort
    puts tree_items
  end
end

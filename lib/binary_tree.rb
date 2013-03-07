require "binary_tree_node"

class BinaryTree
  def initialize
    @root = nil
  end

  # Traverse tree (sans recursion for speed) and look for a home for a given item
  def add_item(item)
    if @root.nil?
      @root = BinaryTreeNode.new(item)
    end

    current_node = @root

    # Traverse the tree and find a place for the item
    while true
      # If item exists, act as though all is fine and return the existing item
      if current_node == item
        return current_node.item
      # move to the left
      elsif current_node > item
        # keep moving
        if current_node.left
          current_node = current_node.left
        # a home has been found for the item
        else
          current_node.left = BinaryTreeNode.new(item)
          return current_node.left.item
        end
      # move to the right
      elsif current_node < item
        # keep moving
        if current_node.right
          current_node = current_node.right
        # A home has been found
        else
          current_node.right = BinaryTreeNode.new(item)
          return current_node.right.item
        end
      end
    end
  end
  alias_method :add, :add_item

  # Traverse tree (sans recursion for speed) and look for a given item
  def find_item(item)
    current_node = @root

    while current_node
      if current_node == item
        return current_node.item
      elsif current_node > item
        current_node = current_node.left
      elsif current_node < item
        current_node = current_node.right
      end
    end

    nil
  end
  alias_method :find, :find_item

  def items
    ordered_items
  end

  private

  def ordered_items(items = nil, current_node = nil)
    if items.nil?
      items = []
      current_node = @root
    end

    if current_node.left
      ordered_items(items, current_node.left)
    end

    items << current_node.item

    if current_node.right
      ordered_items(items, current_node.right)
    end

    items
  end
end

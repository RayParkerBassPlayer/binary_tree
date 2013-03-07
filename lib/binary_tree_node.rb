class BinaryTreeNode
  attr_reader :item
  attr_accessor :left, :right

  def initialize(item)
    @item = item
    @left = @right = nil
  end

  def <(item)
    @item < get_item(item)
  end

  def >(item)
    @item > get_item(item)
  end

  def ==(item)
    @item == get_item(item)
  end

  private

  def get_item(item)
    item.is_a?(BinaryTreeNode) ? item.item : item
  end
end

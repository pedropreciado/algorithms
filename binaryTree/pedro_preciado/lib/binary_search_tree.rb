require "bst_node"
# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      self.class.set_parent(@root, value)
    end
  end

  def find(value, tree_node = @root)
    if tree_node == nil
      return nil
    elsif value == tree_node.value
      return tree_node
    elsif value < tree_node.value
      return find(value, tree_node.left)
    elsif value > tree_node.value
      return find(value, tree_node.right)
    end
  end

  def delete(value)
    @root = find_and_delete(value, @root)

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if !tree_node.right

    self.maximum(tree_node.right)
  end


  def depth(tree_node = @root)
    return -1 if tree_node.nil? # subtrct this recursive step
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)
    if (left_depth > right_depth)
      return left_depth + 1 # include head
    else
      return right_depth + 1
    end
  end

  def is_balanced?(tree_node = @root)
    (depth(tree_node.right) - depth(tree_node.left)) <= 1 && ((depth(tree_node.right) - depth(tree_node.left)) >= 0)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] unless tree_node # add nothing to results array if node is empty

    if tree_node.left
      arr += in_order_traversal(tree_node.left)
    end

    # record value of the current root after left transversal and
    # before you push in the right nodes (always larger)
   arr << tree_node.value

   if tree_node.right
     arr += in_order_traversal(tree_node.right)
   end

   return arr

  end


  private
  def find_and_delete(value, tree_node)
    node = find(value, tree_node)
    return node = nil unless node.left && node.right
    if node.left ^ node.right
      node.value = [node.left.value, node.right.value].max
      return node
    else
  end

  # optional helper methods go here:
  def self.set_parent(subtree, value)
    return BSTNode.new(value) if !subtree

    if value <= subtree.value
      subtree.left = self.set_parent(subtree.left, value)
    else
      subtree.right = self.set_parent(subtree.right, value)
    end

    return subtree
  end
end

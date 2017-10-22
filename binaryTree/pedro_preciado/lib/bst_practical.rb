require "binary_search_tree"

def kth_largest(tree_node, k)
  tree = BinarySearchTree.new
  arr = tree.in_order_traversal(tree_node)
  kth_largest = arr.length - k
  value = arr[kth_largest]
  result = tree.find(value, tree_node)
  return result
end

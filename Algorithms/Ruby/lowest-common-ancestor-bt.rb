# Return the lowest common ancestor in binary tree without access to the node's parent
class LCA_BT
  attr_reader :node_a, :node_b
  attr_accessor :paths, :lca

  def initialize(root, node_a, node_b)
    @root = root
    @node_a = node_a
    @node_b = node_b
    @paths = {}
    @lca = nil
  end

  def calculate_path(target)
    stack = [[@root, [@root]]]

    while stack.length > 0 
      node, path = stack.pop
      stack.push([node.left, path.dup << node]) if node.left
      stack.push([node.right, path.dup << node]) if node.right
      @paths["#{node.val}"] = path if node == target
    end
  end

  def calculate_paths
    [@node_a, @node_b].each do |node|
      calculate_path(node)
    end
  end

  def get_lca
    shortest_path = get_shortest_length(@paths["#{node_a.val}"], @paths["#{node_b.val}"])

    shortest_path.times do |i|
      @lca = @paths["#{node_a.val}"][i] if @paths["#{node_a.val}"][i] == @paths["#{node_b.val}"][i]
    end
  end

  def get_shortest_length(a, b)
    a.length > b.length ? a.length : b.length
  end
end

# Recursively
def lowest_common_ancestor(cur_node, node1, node2)
  return nil if cur_node.nil?
  lca_in_left = lowest_common_ancestor(cur_node.left, node1, node2)
  lca_in_right = lowest_common_ancestor(cur_node.right, node1, node2)
  return cur_node if [node1, node2].include?(cur_node) && (lca_in_left || lca_in_right)
  return cur_node if lca_in_left && lca_in_right
  return lca_in_left if lca_in_left
  return lca_in_right if lca_in_right
  return true if [node1, node2].include?(cur_node)
end

j# Definition for a binary tree node.
# class root
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}

# Recursive
def min_depth(root)
  return 0 unless root
  return 1 unless root.left && root.right

  1 + [min_depth(root.left), min_depth(root.right)].min
end

# Iterative
def min_depth(root)
  return 0 unless root
  min_depth = Float::INFINITY
  stack = [[root, 1]]

  while stack.length > 0
    node, depth = stack.pop
    stack.push([node.left, depth + 1]) if node.left
    stack.push([node.right, depth + 1]) if node.right
    if !node.left && !node.right
      if depth < min_depth
          min_depth = depth
      end
    end
  end

  min_depth
end

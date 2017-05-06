# Given a binary tree, convert it to a doubly linked list without creating new nodes.
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {String[]}

def convert_bst(root)
  stack = [root]
  prev = nil

  while stack.length > 0
    node = stack.pop
    stack.push(node.left) if node.left
    node.left = prev
    stack.push(node.right) if node.right
    node.right = stack.first
    prev = node
  end
end


# in-order traversal, pointing the left pointer to the previous 
# node and right pointer to next in stack.
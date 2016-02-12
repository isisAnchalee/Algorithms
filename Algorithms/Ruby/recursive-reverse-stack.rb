# Reverse a stack using recursion
# The idea of the solution is to hold all values in Function Call Stack until the stack becomes empty. When the stack becomes empty, insert all held items one by one at the bottom of the stack.
# For example, let the input stack be
#
# Time Complexity: O(n**2)
# Space Complexity: O(n)
#
#     1  <-- top
#     2
#     3
#     4   
# First 4 is inserted at the bottom.
#     4 <-- top

# Then 3 is inserted at the bottom
#     4 <-- top    
#     3

# Then 2 is inserted at the bottom
#     4 <-- top    
#     3 
#     2
     
# Then 1 is inserted at the bottom
#     4 <-- top    
#     3 
#     2
#     1

def reverse(stack)
  if !stack.is_empty?
    temp = stack.pop
    reverse(stack)
    insert_at_bottom(stack, temp)
  end
end

def insert_at_bottom(stack, item)
  if stack.is_empty? 
    stack.push(item)
  else
    temp = stack.pop
    insert_at_bottom(stack, item)
    stack.push(temp)
  end
end

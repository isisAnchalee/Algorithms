# Sort a stack using recursion
# Given a stack, sort it using recursion. Use of any loop constructs like while, for..etc is not allowed. 
# We can only use the following ADT functions on Stack S:
#
# Time Complexity: O(n**2)
# Space Complexity: O(n)
#

def sort_stack(stack)
  if !stack.is_empty?
    temp = stack.pop
    sort_stack(stack)
    sorted_insert(stack, temp)
  end
end

def sorted_insert(stack, element)
  if stack.is_empty? || element > stack.peek
    push(stack, element)
  else 
    temp = stack.pop
    sorted_insert(stack, element)
    stack.push(temp)
  end
end

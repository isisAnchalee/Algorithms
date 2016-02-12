# Given a singly linked list, determine if it is a palindrome.
#
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}

def list_palindrome(list)
  stack = []
  current = list.head

  while current
    stack.push(current.value)
    current = current.next
  end

  current = list.head
  while current 
    stack_temp = stack.pop
    return false if current.value != stack_temp
    current = current.next
  end
  true 
end

def list_check(list)
  return false unless list

  stack = []
  slow = fast = list.head

  while fast && fast.next != nil
    fast = fast.next.next 
    stack.push(slow.value)
    slow = slow.next
  end

  # if word has odd number letters
  if fast != nil
    slow = slow.next
  end

  while slow != nil
    temp = stack.pop
    return false if slow.value != temp 
    slow = slow.next
  end

  true
end

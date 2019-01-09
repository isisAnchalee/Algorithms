def is_palindrome(head)
  stack = []
  slow_runner = fast_runner = head

  while fast_runner != nil && fast_runner.next != nil
    stack.push(slow_runner.val)
    fast_runner = fast_runner.next.next
    slow_runner = slow_runner.next
  end
  
  if fast_runner != nil
    slow_runner = slow_runner.next
  end

  while slow_runner != nil
    temp = stack.pop
    return false if slow_runner.val != temp
    slow_runner = slow_runner.next
  end

  true
end


# Without buffer: Split linked list at center, reverse second half and compare, if values do not match return false, else return true.
def is_palindrome(head)
    return true if !head || !head.next
    s = head
    f = s.next.next
    while f && f.next
      s = s.next
      f = f.next.next
    end
    h2 = s.next
    s.next = nil
    rev_h2 = reverse(h2)
    while head
      if head.val != rev_h2.val
        return false
      end
      head = head.next
      rev_h2 = rev_h2.next
    end
    return true
end

def reverse(head)
  return head if !head.next
  curr = head
  prev = nil
  after = curr
  while curr
    after = after.next
    curr.next = prev
    prev = curr
    curr = after
  end
  return prev
end

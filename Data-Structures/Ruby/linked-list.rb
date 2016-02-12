class Node
  attr_accessor :value, :next

  def initialize(val,next_in_line)
    @value = val
    @next = next_in_line
  end
end

class LinkedList

  attr_accessor :head
  def initialize(val)
      # Initialize a new node at the head
      @head = Node.new(val,nil)
  end
  
  def add(value)
      # Traverse to the end of the list
      # And insert a new node over there with the specified value
      current = @head
      while current.next != nil
          current = current.next
      end 
      current.next = Node.new(value,nil)
      self    
  end

  def delete(val)
    current = @head
    if current.value == val
        @head = @head.next
    else
      while current.next != nil
        current = current.next
        if current.value == val
          current.value = current.next.value || nil
          current.next = current.next.next
        end
      end
    end
    @head
  end
end
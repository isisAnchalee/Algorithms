class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      link = @map[key]
      update_link!(link)
      link.val
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    new_link = @store.insert(key, val)
    @map[key] = new_link

    eject! if count > @max
    val
  end

  def update_link!(link)
    link.prev.next = link.next
    link.next.prev = link.prev

    link.prev = @store.tail.prev
    @store.tail.prev.next = link
    link.next = @store.tail
    @store.tail.prev = link
  end

  def eject!
    rm_link = @store.head.next
    rm_link.prev.next = rm_link.next
    rm_link.next.prev = rm_link.prev
    @map.delete(rm_link.key)
    nil
  end
end

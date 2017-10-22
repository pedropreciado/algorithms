class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    if self.prev
      self.prev.next = self.next
    end
    if self.next
      self.next.prev = self.prev
    end
    self.next = nil
    self.prev = nil
    return self

  end
end

class LinkedList

  include Enumerable


  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    value = nil
    j = 0
    self.each do |node|
      if i == j
        value = node
      end
      j += 1
    end
    return value
  end

  def first
    value = @head.next
    if empty?
      value = nil
    end
    return value
  end

  def last
    if empty?
      return nil
    else
      @tail.prev
    end
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val

      end
    end
    return nil
  end

  def include?(key)
    self.any? { |node| node.key == key }
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev = new_node
    return new_node
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end
  end


  def each
    curr_node = @head.next
    until curr_node == @tail
      yield curr_node
      curr_node = curr_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end

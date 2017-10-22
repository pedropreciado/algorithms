require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 4
    @length = 0
    @store = StaticArray.new(@length)
  end

  # O(1)
  def [](index)

    raise "index out of bounds" if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    if @capacity >= @length
      resize!
    end
    @store[index] = value
    @length += 1
    p @store
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @capacity >= @length
      resize!
    end
    @store[@length + 1] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    @length -= 1
    
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @capacity >= @length
      resize!
    end
    i = @length - 1
    while (i) >= 0
      #reassign all elements to on index up
      @store[i + 1] = @store[i]
      i -= 1
    end
    @length += 1
    @store[0] = val

  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    resized = StaticArray.new(@length * 2)
    i = 0
    while i < @length
      resized[i] = @store[i]
      i += 1
    end
    @capacity *= 2
    @store = resized
  end
end

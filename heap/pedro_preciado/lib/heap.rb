class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc ||= Proc.new { |a, b| a <=> b }
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[@store.length - 1] = @store[@store.length - 1], @store[0]
    max = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, &@prc)

    return max
  end


  def peek
    return store[0]
  end

  def push(val)
    @store << val
    self.class.heapify_up(@store, @store.length - 1, @prc)
  end

  public
  def self.child_indices(len, parent_index)
    first = (2 * parent_index) + 1
    second = (2 * parent_index) + 2
    indices = []

    unless first >= len
      indices << first
    end
    unless second >= len
      indices << second
    end
    return indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    return (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)

    prc ||= Proc.new {|a, b| a <=> b }
      left, right = self.child_indices(len, parent_idx)

      return array if right.nil? && left.nil?

      right_child = array[right] if right
      left_child = array[left] if left

      if right_child.nil? || prc.call(left_child, right_child) < 0
        swap_idx = left
      else
        swap_idx = right
      end

      if prc.call(array[parent_idx], array[swap_idx]) > 0
        array[parent_idx], array[swap_idx] = array[swap_idx], array[parent_idx]
        self.heapify_down(array, swap_idx, len, &prc)
      end
    return array


  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)

    prc ||= Proc.new { |a, b| a <=> b }

    if child_idx == 0 # root
      return array
    end

    parent_idx = self.parent_index(child_idx)

    parent = array[parent_idx]
    child = array[child_idx]

    case prc.call(child, parent)
    when 1
      return array
    else
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      self.heapify_up(array, parent_idx, len, &prc)
    end

  end
end

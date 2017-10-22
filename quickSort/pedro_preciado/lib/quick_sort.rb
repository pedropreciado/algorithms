class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array[0]
    left = array.select { |el| pivot > el }
    right = array.select { |el| pivot < el}

    return self.sort1(left) + [pivot] + self.sort1(right)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)

    return array if length <= 1

    prc ||= Proc.new { |a, b| a <=> b }

    pivot = self.partition(array, start, length, &prc) # this will return the index of el in correct position

    left = pivot - start
    right = length - (left + 1)
    self.sort2!(array, start, left, &prc) # sort left and send down left partition
    self.sort2!(array, pivot + 1, right, &prc) # sort right and send down right partition

    return array
  end

  def self.partition(array, start, length, &prc)

    prc ||= Proc.new { |a, b| a <=> b }

    pivot = array[start]
    barrier = start

    i = start + 1

    while i < start + length
      case prc.call(pivot, array[i])
      when 1
        array[i], array[barrier + 1] = array[barrier + 1], array[i]
        barrier += 1
      end
      i +=1
    end

    array[barrier], array[start] = array[start], array[barrier]

    return barrier
  end
end

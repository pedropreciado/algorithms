require_relative 'heap'

def k_largest_elements(array, k)
  #heap sort array and then return slice from k -> last el
  (1..array.length-1).each do |i|
    BinaryMinHeap.heapify_up(array, i)
  end

  heap_length = array.length

  until heap_length == 1
    array[0], array[heap_length-1] = array[heap_length-1], array[0]
    heap_length -= 1
    BinaryMinHeap.heapify_down(array, 0, heap_length)
  end

  initial = array.length - k

  array.reverse![initial..-1]
end

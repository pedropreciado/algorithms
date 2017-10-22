require_relative "heap"

class Array
  def heap_sort!
    (1..self.length-1).each do |i|
      BinaryMinHeap.heapify_up(self, i)
    end

    heap_length = self.length
    until heap_length == 1
      self[0], self[heap_length-1] = self[heap_length-1], self[0]
      heap_length -= 1
      BinaryMinHeap.heapify_down(self, 0, heap_length)
    end

    self.reverse!

    # heap = BinaryMinHeap.new
    # self.each do |el|
    #   heap.push(el)
    # end
    # result = []
    # while result.length <= heap.count
    #   heap.class.heapify_down(heap.store, 0, heap.count)
    #   result << heap.extract
    # end
    # return result
  end
end

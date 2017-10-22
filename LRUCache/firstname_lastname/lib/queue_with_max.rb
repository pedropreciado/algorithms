# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = []
    @maxs = [0]
  end

  def enqueue(val)
    p val
    p @maxs[-1]
    p val > @maxs[-1]
    if val > @maxs[-1]
      p "here"
      @maxs.push(val)
    end
    @store.push(val)
    return @store
  end

  def dequeue
    p @store
    if @store[0] == @maxs[-1]
      @maxs.pop
    end
    @store.shift
    p "maxs: #{@maxs}"
    end

  def max
    @maxs[-1]
  end

  def length
    @store.length
  end

end

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    acc = 0
    self.each_with_index.inject(0) do |hash, (el, i)|
      (el.hash + i.hash) ^ hash
    end
  end
end

class String
  def hash
    # result = self.chars.map do |char|
    #   char.ord
    # end
    #
    # result.reduce(:+).hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end

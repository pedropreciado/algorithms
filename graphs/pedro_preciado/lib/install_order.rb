# Given an Array of tuples, where tuple[0] represents a package id,

# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require "graph"
require "topological_sort"

def install_order(arr)
  max = arr.flatten.uniq.max
  p max
  edges = []
  arr.each do |package|
    edges << Edge.new(Vertex.new(package[1]), Vertex.new(package[0]))
  end

  vertices = {}
  edges.each do |edge|
    vertices[edge.to_vertex] = nil
    vertices[edge.from_vertex] = nil
  end

  result = topological_sort(vertices.keys)

  sorted = []

  result.each do |vertex|
    sorted << vertex.value
  end

  (0..max).each do |i|
    unless sorted.include?(i)
      sorted.unshift(i)
    end
  end

  p sorted.index(8)
  return sorted
end

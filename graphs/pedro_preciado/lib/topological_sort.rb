require_relative 'graph'

# Implementing  topological sort using both Khan's and Tarian's algorithms
#
def topological_sort(vertices)

  sorted = []
  queue = []

  in_edges = {}

  vertices.each do |vertex|
    if vertex.in_edges.empty?
      queue << vertex
    end
    in_edges[vertex] = vertex.in_edges.length
  end


  until queue.empty?
    u = queue.pop
    sorted << u
    u.out_edges.each do |edge|
      in_edges[edge.to_vertex] -= 1
      if in_edges[edge.to_vertex] == 0
        queue << edge.to_vertex
      end
    end

  end

  if vertices.length != sorted.length
    return []
  else
    return sorted
  end
end

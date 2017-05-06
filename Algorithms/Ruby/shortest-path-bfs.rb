class BFS

  attr_accessor :graph, :s, :distance, :edge_to

  def initialize(graph, s)
    @graph = graph
    @s = s
    @distance = []
    @edge_to = {}

    bfs
  end

  def bfs
    queue = [@s]

    while queue.length > 0
      node = queue.shift
      @graph[node].each do |child_node|
        unless @distance[child_node]
          queue.push(child_node)
          @distance[child_node] = @distance[node] + 1
          @edge_to[child_node] = node
        end
      end
    end
  end

  def has_path_to?(v)
    @distance[v]
  end

  def shortest_path(v)
    stack = [v]

    while v != @s
      v = @edge_to[v]
      stack.push(v)
    end

    stack.push(@s)
  end
end
# Resolve dependencies

class TopologicalSort
  attr_accessor :post_order

  def initialize(graph, s)
    @post_order = []
    @visited = []
    @graph = graph
    @source = s

    dfs
  end

  # post_order will end up being the order in which the dependencies resolve
  
  private
  def dfs(node)
    stack = [@source]

    while stack.length > 0
      node = stack.pop
      @graph[node].each do |child_node|
        unless @visited.include?(child_node)
          stack.push(child_node)
          visited.push(child_node)
        end
        @post_order << node
      end
    end
  end
end

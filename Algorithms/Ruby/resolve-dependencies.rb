class TopologicalSort

  def initialize(graph)
    @graph = graph
    @resolved = {}
    @ordering = []
  end

  def topological_sort
    @graph.keys.each do |node|
      dfs(node) unless @resolved[node]
    end
    @ordering
  end

  def dfs(node, chain = {})
    @graph[node].each do |child|
      raise 'circular dependency' if chain[child]
      chain[child] = true
      dfs(child, chain) unless @resolved[child]
    end
    @resolved[node] = true
    @ordering << node
  end
end

graph = {
  A: [:B, :C],
  B: [:E],
  C: [:D],
  D: [:C],
  E: []
}

puts TopologicalSort.new(graph).topological_sort

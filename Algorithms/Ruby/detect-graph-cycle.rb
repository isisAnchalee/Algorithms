# Determine if a graph has a cycle
#
# DFS traversal of the graph. 
# For every visited vertex ‘v’, if there is an adjacent ‘u’ 
# such that u is already visited and u is not parent of v, then there is a cycle in graph.
# If we don’t find such an adjacent for any vertex, we say that there is no cycle.

class GraphCycleDetection
  def initialize(graph)
    @graph = graph
    @seen = {}
    @ordering = []
  end

  def topological_sort
    @graph.keys.each do |node|
      dfs(node) unless @seen[node]
    end
    @ordering
  end

  def dfs(node, chain = {})
    @graph[node].each do |child|
      raise 'circular dependency' if chain[child]
      chain[child] = true
      dfs(child, chain) unless @seen[child]
    end
    @seen[node] = true
    @ordering << node
  end
end
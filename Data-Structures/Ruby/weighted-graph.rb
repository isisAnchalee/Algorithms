class Graph
  attr_accessor :nodes
  attr_accessor :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    nodes << node
    node.graph = self
  end

  def add_edge(from, to, weight)
    edges << Edge.new(from, to, weight)
  end
end

class Edge
  attr_accessor :from, :to, :weight

  def initialize(from, to, weight)
    @from, @to, @weight = from, to, weight
  end

  def <=>(other)
    self.weight <=> other.weight
  end

  def to_s
    "#{from.to_s} => #{to.to_s} with weight #{weight}"
  end
end

class Node
  attr_accessor :name, :graph

  def initialize(name)
    @name = name
  end

  def adjacent_edges
    graph.edges.select{|e| e.from == self}
  end

  def to_s
    @name
  end
end

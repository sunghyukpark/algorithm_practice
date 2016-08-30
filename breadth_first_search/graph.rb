class Graph
  def add_edge(node_1, node_2)
    node_1.adjacents << node_2
    node_2.adjacents << node_1
  end
end
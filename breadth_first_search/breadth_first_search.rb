# Put unvisited nodes on a queue
# Solves the shortest path problem: Find path from "source" to "target"
# that uses the fewest number of edges
# It's not recursive (like depth first search)
#
# The steps are quite simple:
# * Put s into a FIFO queue and mark it as visited
# * Repeat until the queue is empty:
#   - Remove the least recently added node n
#   - add each of n's unvisited adjacents to the queue and
#     mark them as visited

require_relative 'graph'
require_relative 'node'

class BreadthFirstSearch
  attr_accessor :visited
  def initialize(graph, node)
    @graph = graph
    @node = node
    @visited = []
    @edge_to = {}

    bfs(node)
  end

  # returns the shortest path
  def shortest_path_to(dest_node)
    return unless has_path_to?(dest_node)
    path = []
    while (dest_node != @node) do
      path.unshift(dest_node)
      dest_node = @edge_to[dest_node]
    end
    path.unshift(@node)
  end

  def shortest_path_length(dest_node)

  end

  def has_path_to?(dest_node)
    @visited.include?(dest_node)
  end

  def bfs(node)
    q = []

    # enqueue source node and mark it as visited
    q << node
    @visited << node;

    while (q.length != 0)
      current = q.shift  #remove first element
      if current.adjacents.length > 0
        current.adjacents.each do |adjacent|
          next if @visited.include?(adjacent)
          q << adjacent
          @visited << adjacent
          @edge_to[adjacent] = current
        end
      end
    end
  end
end

# Initialzie nodes
node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)
node_4 = Node.new(4)
node_5 = Node.new(5)
node_6 = Node.new(6)

# Initialize graph (connect nodes)
graph = Graph.new
graph.add_edge(node_1,node_2)
graph.add_edge(node_1,node_3)
graph.add_edge(node_2,node_4)
graph.add_edge(node_3,node_4)
graph.add_edge(node_4,node_5)
graph.add_edge(node_4,node_6)

bfs_node1 = BreadthFirstSearch.new(graph, node_1)
p bfs_node1.visited
p bfs_node1.has_path_to?(node_4)
p bfs_node1.has_path_to?(node_6)
p bfs_node1.shortest_path_to(node_6)
require "set"

class Node
  attr_accessor :data, :adjacents

  def initialize(data)
    @data = data
    @adjacents = Set.new
  end
end
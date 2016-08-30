class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

head = Node.new(nil)
node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)
head.next = node_1
node_1.next = node_2
node_2.next = node_3
p head


def reverse_print(head)
  if head = nil
    return
  end

  reverse_print(head.next)
  p head.data
end

reverse_print(head)
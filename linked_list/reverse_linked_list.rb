class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  def initialize
    @head = Node.new(nil)
    @head.next = nil
  end

  # add node to linked list
  def self.add(node)
  end

  # delete matching node (contain specific value)
  def self.delete(node)
  end

  # recursively find last node
  def self.last(node)
    return node if node.next == nil
    node = last(node.next)
  end

  # iteratively find last node
  def self.last_iter(node)
    while node.next != nil
      node = node.next
    end
    node
  end

  # print list of nodes (its index, data)
  def self.node_list(node)
    while node.next != nil
      if node.data == nil
        print "head"
      end
      print "#{node.data}->"
      node = node.next
    end
    print "#{node.data}->nil"
  end

  # Iterative
  def self.reverse_iterative(head)
    prev = nil
    current = head

    while current != nil
      nxt = current.next
      current.next = prev
      prev = current
      current = nxt
    end
  end

  # Recursive
  def self.reverse_recursive(head)
    prev = nil
    current = head
    nxt = current.next

    return if current == nil # base case

    current.next = prev
    reverse_recursive(nxt)
  end

end


# Construct node
head = Node.new(nil)
node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)
head.next = node_1
node_1.next = node_2
node_2.next = node_3
node_3.next = nil

# last - recursion
puts "Last - recursion: "
puts LinkedList.last(head).data

# last - iteration
puts "Last - iteration: "
puts LinkedList.last_iter(head).data

puts LinkedList.node_list(head)




require_relative "queue"


class Node
  attr_accessor :value, :right, :left

  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end
end

module BinaryTree
  def BinaryTree.level_order(root)
    return if root.nil?

      # initialize queue of size 20 / push root value to start with
      queue = ArrayQueue.new(20)
      queue.enqueue(root)

      while(!queue.empty?)
        current = queue.front
        print current.value.to_s + " "
        queue.enqueue(current.left) if current.left
        queue.enqueue(current.right) if current.right
        queue.dequeue
      end
    end

  def BinaryTree.pre_order(root)
    return if root.nil?

    print root.value.to_s + " "
    pre_order(root.left) if root.left
    pre_order(root.right) if root.right
  end

  def BinaryTree.in_order(root)
    return if root.nil?

    in_order(root.left) if root.left
    print root.value.to_s + " "
    in_order(root.right) if root.right
  end

  def BinaryTree.post_order(root)
    return if root.nil?

    post_order(root.left) if root.left
    post_order(root.right) if root.right
    print root.value.to_s + " "
  end
end


root = nil

p "Corner cases"
p BinaryTree.level_order(root) == nil


root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)




p "Pre order: "
BinaryTree.pre_order(root)
puts
p "In order: "
BinaryTree.in_order(root)
puts
p "Post order: "
BinaryTree.post_order(root)
puts
p "Level order: "
BinaryTree.level_order(root)
puts




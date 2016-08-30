# Array implementation of stack - last in first out
# Insertion and Deletion can be performed only from one end - top
# Push(x) - push x to the end of the array
# Pop() - get element at the end of the array
# Peek() - check last-in element
# IsEmpty() - check if stack is empty

# all operations in constant time
# pop and push at the same location - top (end of array)
# has static size

class Stack
  def initialize(capacity)
    raise ArgumentError("Capacity should be at least 1") if capacity < 1
    @capacity = capacity
    @store = Array.new(@capacity)
    @top = -1
  end

  def push(element)
    return nil if element.nil? || full?
    @top += 1
    @store[@top] = element
    self
  end

  def pop
    return nil if empty?
    popped = @store[@top]
    @store[@top] = nil
    @top -= 1
    popped
  end

  def peek
    return nil if empty?
    @store[@top]
  end

  def full?
    @top == @capacity - 1
  end

  def empty?
    @top == -1
  end
end

arrstack = Stack.new 2
arrstack.push 5
arrstack.push 10
p arrstack.full?
p arrstack.peek == 10
p arrstack.pop == 10
p arrstack.empty? == false



# linked list representation of stack
# push and pop at top - head of linked list
# top is a NODE with pointer to first element (nil if empty) with no data
# memory management - should make a node when we need it
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end


class LinkedStack
  attr_accessor :top

  def initialize
    @top = Node.new nil
  end

  def push(element)
    if @top.next == nil
      @top.next = Node.new element
    else
      new_node = Node.new element
      new_node.next = @top.next
      @top.next = new_node
    end
  end

  def pop
    return if @top.next == nil
    temp = @top.next
    @top.next = temp.next
    temp
  end

  def peek
    @top.next
  end

  def is_empty?
    @top.next == nil
  end
end

llstack = LinkedStack.new
llstack.push(2)
llstack.push(5)
p llstack.top.next.data == 5
p llstack.top.next.next.data == 2
llstack.pop
p llstack.top.next.data == 2
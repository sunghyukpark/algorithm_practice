# From RubyMonk
# Assuming static array (Ruby supports dynamic)
# Operation performed at the end of array (head)
# Insert at the beginning of array

class ArrayQueue
  def initialize(size)
    @size = size
    @store = Array.new(@size)
    @head = -1
    @tail = 0
  end

  def enqueue(element)
    if element.nil? # sanity check
      nil
    end

    if full?
      new_store = Array.new(@size * 2)
      for i in 0..@size - 1
        new_store[i] = @store[i]
      end
      @store = new_store
    end

    @tail -= 1
    @store[@tail] = element
    self
  end

  def dequeue
    if empty?
      nil
    else
      @tail += 1
      # dequeued = @store[@head]
      # @store.unshift(nil)
      dequeued = @store.pop
      dequeued
    end
  end

  def front
    @store[@head]
  end

  def empty?
    @head == -1 && @tail == 0
  end

  def full?
    @tail.abs == @size
  end
end


# Tests for ArrayQueue
arq = ArrayQueue.new(4)
arq.enqueue(1)
arq.enqueue(2)
arq.enqueue(3)
arq.enqueue(4)

p arq.front == 1
p arq.empty? == false
p arq.full? == true
p arq.enqueue(5) == nil
p arq.dequeue
p arq.dequeue
p arq.front == 3



class Node
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end


class LinkedQueue
  def initialize
  end
end

# Tests for LinkedQueue

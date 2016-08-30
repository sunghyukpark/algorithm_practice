class PriorityQueue
  attr_accessor :store

  def initialize
    # fill in first index
    @store = [nil]
  end


  def push(element)
    return if element.nil?

    # push element
    @store.push(element)

    # restore max heap property
    bubble_up(@store.length-1)
  end


  # replace with last element
  # get max element (return value)
  # bubble down to keep heap property
  def pop
    return if @store.empty?
    swap(1,-1)
    max = @store.pop
    bubble_down(1)
    max
  end


  private

  def bubble_up(index)
    parent_index = index/2
    return if index <= 1
    return if @store[index] <= @store[parent_index]

    swap(index, parent_index)

    bubble_up(parent_index)
  end


  def swap(i1, i2)
    @store[i1], @store[i2] = @store[i2], @store[i1]
  end


  def bubble_down(index)
    child_index = index * 2
    return if child_index > @store.size - 1

    not_the_last_element = child_index < @store.size - 1
    left_child = @store[child_index]
    right_child = @store[child_index+1]
    child_index += 1 if not_the_last_element && right_child > left_child

    return if @store[index] >= @store[child_index]

    swap(index, child_index)

    bubble_up(child_index)
  end


end
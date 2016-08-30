# PSEUDOCODE
# 1. binary_tree is given as a form of array?
# 2. binary_tree does not have an empty node?
# 3. balanced? (binary tree has at most 2 children)
# 4. Range of values given? (to check int_min and int_max)

# BRUTE FORCE SOLUTION
# 1. Perform in-order traversal and store elements in O(n) time - go over all nodes
# 2. Scan through array/list of elements from in-order traversal
# 3. Check if ith element is bigger than i+1th element, if there is such case return false
#   - takes O(n) time to go over the array.
# 4. Otherwise return true.

# EFFICIENT SOLUTION
# 1. CHECK each node - within the range of its ancestors
# 2. left_child - should be smaller than ancestor
# 3. right_child - should be bigger than ancestor
# 4. min, max value updated for each recursive call
# 5. takes O(n) time

# arbitrarily small and large number
int_max = 1000000
int_min = -100000

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

#############################
## 1. BRUTE FORCE SOLUTION ##
#############################

# in_order traversal & check if store array is constantly increasing
# O(n) to traverse tree
# O(n) to iterate over array

# def is_bst?(root)
#   return true if root.nil?

#   store = []
#   in_order_fill(root,store)

#   for i in 0..store.length-2
#     if store[i] > store[i+1]
#       return false
#     end
#   end

#   return true
# end

# # # traverse tree in_order and store element in input array
# def in_order_fill(root, arr)
#   return if root.nil?

#   in_order_fill(root.left, arr) if root.left
#   arr << root.value
#   in_order_fill(root.right, arr) if root.right
# end

##########################################################
##########################################################

def is_bst?(root)

  if is_subtree_lesser(root.left, root.value) &&
     is_subtree_greater(root.right, root.value) &&
     is_bst?(root.left) &&
     is_bst?(root.right)
     return true
  else
    return false
  end
end

# check if all elements in tree is lesser than value
def is_subtree_lesser(root, value)
end

def is_subtree_greater(root, value)
end




## TEST COVERAGE ##
## expects true, false, true, true
root = Node.new(5)
root.left = Node.new(2)
root.right = Node.new(10)

# True
p is_bst?(root)

root.left = Node.new(7)

# False
p is_bst?(root)

## Level-2 Tree ##
root = Node.new(10)
root.left = Node.new(8)
root.left.left = Node.new(4)
root.left.right = Node.new(9)
root.right = Node.new(20)
root.right.left = Node.new(17)
root.right.right = Node.new(25)

# True
p is_bst?(root)

# CORNER CASE
root = nil

# True
p is_bst?(root)




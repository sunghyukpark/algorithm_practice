class Node
  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

# root is node
# target is integer value to insert into given tree, at proper position

class BinarySearchTree
  def initialize(root)
    @root = root
  end

  # O(logn) time complexity
  # height of the tree
  # stack overflow in recursive call
  def search_recursive(target)
    return if target.nil? || @root.nil? # sanity check
    return @root if target == @root.value # base case

    if target < @root.value
      search_recursive(@root.left, target)
    else
      search_recursive(@root.right, target)
    end
  end


  # O(logn) time complexity
  def search_iterative(target)
    return if target.nil? || @root.nil? # sanity check
    current = @root

    while(current)
      if target == current.value
        return current
      elsif target < current.value
        current = current.left
      else
        current = current.right
      end
    end

    # search failed at this point
    return nil
  end


  # insert Node with value = target into BST
  # return root of the tree after insert
  # return nil if the element already exists in the tree
  # Search/ Point of failure / Insert
  # BST property (left subtree < root < right subtree)
  # should be retained
  # O(logn) time complexity

  def insert(target)
    return if target.nil? # sanity check
    current = @root
    prev = nil
    left = false

    # Search iteratively
    while current
      if target == current.value
        raise ArgumentError("Item already exists in the tree") # return if exists
      end

      # set prev before updating current
      prev = current

      if target < current.value
        left = true
        current = current.left
      else
        left = false
        current = current.right
      end
    end

    # Find point of failure & make node instance with target value
    temp = Node.new(target)

    # empty tree case
    return temp if @root.nil?

    # insert & return root
    if left
      prev.left = temp
    else
      prev.right = temp
    end
    return @root
  end




  # delete Node with value = target from BST
  # BST property retained
  # search % delete ->
  # O(logn) time complexity
  def delete(target)
    return if target.nil?

    current = @root
    parent = nil
    left = false

    while current
      # found target to delete -> move to deletion logic
      if target == current.value
        break
      end

      # update parent before updating current
      parent = current

      if target < current.value
        left = true
        current = current.left
      else
        left = false
        current = current.right
      end
    end

    # element not found
    if current.nil?
      raise ArgumentError("No such element exists")
    end

    # Leaf Node
    if is_leaf?(current)
      if left
        parent.left = nil
      else
        parent.right = nil
      end
    end

    # Two children
    if has_both_children?(current)
      left_max = find_max(current.left)

      if left
        parent.left = left_max
      else
        temp = current.left
        current = left_max
        current.left = temp
      end

    # One child
    else
    end

  end


  def is_leaf?(node)
    node.left.nil? && node.right.nil?
  end


  def has_both_children?(node)
    node.left && node.right
  end


  # finds maximum element in the tree
  def find_max(root)
    return if root.nil?
    current = root

    while current.right
      current = current.right
    end

    return current
  end

  # finds minimum element in the tree
  def find_min(root)
    return if root.nil?
    current = root

    while current.left
      current = current.left
    end

    return current
  end


  def find_min_iteratvie
  end


  def find_min_recursive
  end


  def find_max_iterative
  end


  def find_max_recursive
  end
end


# Tests
root = Node.new(4)
bst = BinarySearchTree.new(root)
bst.insert(1)
bst.insert(2)
bst.insert(3)
bst.insert(5)
bst.insert(5.5)
bst.insert(6)
bst.insert(5.7)
p bst.find_max(root)
p bst.find_min(root)



  # def delete(root, target)                     # returns root for recursion
  #   if root == nil                             # recursion base case
  #     return root
  #   elsif target < root.value
  #     root.left = delete(root.left, target)
  #   elsif target > root.value
  #     root.right = delete(root.right, target)
  #   else                                       # we found a node to delete (target == root.value)
  #     # Case 1: No child
  #     if root.left == nil && root.right == nil
  #       root = nil
  #     # Case 2: One child
  #     elsif root.left == nil
  #       temp = root
  #       root = root.right
  #       temp = nil
  #     elsif root.right == nil
  #       temp = root
  #       root = root.left
  #       temp = nil
  #     # Case 3: Two children
  #     else
  #       temp = find_min_recursive(root.right)
  #       root.value = temp.value
  #       root.right = delete(root.right, temp.value)
  #     end
  #   end
  #   root
  # end

  #  def find_min_iterative(root)
  #   return -1 if root == nil
  #   while root.left != nil
  #     root = root.left
  #   end
  #   return root.value
  # end

  # def find_max_iterative(root)
  #   return -1 if root == nil
  #   while root.right != nil
  #     root = root.right
  #   end
  #   return root.value
  # end

  # def find_min_recursive(root)
  #   return -1 if root == nil
  #   return root.value if root.left == nil
  #   return find_min_recursive(root.left)
  # end

  # def find_max_recursive(root)
  #   return -1 if root == nil
  #   return root.value if root.right == nil
  #   return find_max_recursive(root.right)
  # end




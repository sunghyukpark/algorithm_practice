class Node (value)
  @value = value
  @left = nil
  @right = nil
end

def lca(root, n1,n2)
  # base case
  return nil if root == nil

  if n1 < root.value && n2 < root.value
    lca(root.left, n1,n2)
  elsif n1 > root.value && n2 > root.value
    lca(root.right, n1, n2)
  else
    return root
  end
end


class Node (value)
  @value = value
  @left = nil
  @right = nil
end

def lca_binary(root, n1, n2)
  return nil if root == nil

  if root.value == n1 || root.value == n2
    return root
  end

  left_lca = lca_binary(root.left, n1, n2)
  right_lca = lca_binary(root.right, n1, n2)

  return root if left_lca && right_lca

  if left_lca != nil
    return left_lca
  else
    return right_lca
  end
end
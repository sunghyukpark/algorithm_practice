# Frog River
# Array A[i] = K, at time i, leaves fall at position K
# X - final step of crossing
# frog currently located at positon 0
# Calculate time it takes to
# example
# index -> time, value->position

def frog_river(x,a)
  landed_leaves = Array.new(x)
  todo = x
  len = a.length

  for i in 0..len-1
    leaf_index = a[i]-1
    if landed_leaves[leaf_index] == nil
      landed_leaves[leaf_index] = true
      todo -= 1
    end
    return i+1 if todo == 0
  end
  return -1
end

arr = [1,2,4,4,5,3]
arr2 = [2,3,1,4,5]
arr3 = [1,1,1,1,1,2,3,4,5]
x = 5

p frog_river(x, arr) == 6
p frog_river(x, arr2) == 5
p frog_river(x, arr3) == 9


# little tweak
# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a, x, d)
    return 0 if d >= x
    return 0 if a[0] >= (x-d)

    # new array to keep track of leaves position
    # value true if leaf is there.
    # max size of new array is always at max: x
    landed_leaves = Array.new(x)

    # after x-d leaves fall on diff position, frog can always jump pond
    # with additional leaf (if it lands in new position)
    leaf_count = x-d

    # len equal to N
    len = a.length
    for i in 0..len-1
        # check if frog is able to do last jump, as in example
        if a[i] >= (x-d)
            return i
        end
        landed_index = a[i]-1
        if landed_leaves[landed_index] == nil
            landed_leaves[landed_index] = true # leaf in position a[i]
            leaf_count -= 1
        end
        return i if leaf_count <= 0
    end
    # outside for loop
    # frog never cross pond
    return -1
end
# Given array, magic index => A[i] = i
# If there's any, list magic index in an array.
# 1. Sorted Array with Distinct Numbers
# 2. Sorted Array with non-distinct Numbers
# Questions
#   - Assume every element of array is not empty? (not nil?)
#   - find one instance of magic index

# 1. Sorted and Distinct
# [2,4,5,8]
# [1,3,4,5]
# [0,1,1,3] - smaller case, numbers not distinct
# [0,1,2,4]
# check from left to right. Stop when it's NOT a magic index.
# A[0] in example 1,2 (in these two cases, guarantee that there's no magic index)
# A[3] in example 3.

# brute force - iterate over array
def ifind_magic(arr)
  return false if arr.size == 0
  s = arr[0]
  e = arr[-1]
  magic_arr = []
  i = 0
  while s < e
    return magic_arr if arr[i] != i
    if arr[i] == i
      magic_arr[i] = i
    end
    i += 1
  end
end
# O(n), n being size of arr



# Binary Search (it's SORTED!!)
def bsfind_magic(arr)
  size = arr.size
  return false if size == 0
  mid_index = (size/2).floor
  # edge case
  # check if start or end of array is magic_index or not
  if size == 1
    if mid_index == arr[mid_index]
      return mid_index
    else
      return false
    end
  end
  # compare index and element of array
  if mid_index > arr[mid_index]
    right_arr = arr[mid_index+1..-1]
    bsfind_magic(right_arr)
  elsif mid_index < arr[mid_index]
    left_arr = arr[0..mid_index-1]
    bsfind_magic(left_arr)
  else
    return arr[mid_index]
  end
  return false
end

# textbook solution
def bsfind_magic_soln(arr, s, e)
  if e < s || s < 0 || e >= arr.size
    return -1
  end
  mid = ((s+e)/2).floor
  if mid == arr[mid]
    return mid
  elsif mid > arr[mid]
    bsfind_magic_soln(arr, mid+1, e)
  else
    bsfind_magic_soln(arr, s, mid-1)
  end
end

# Numbers not distinct (still sorted)
# previous soln does not work - magic index could be on either side of array
# should search both left and right

def bsfind_magic_nd(arr, s, e)
  if e < s || s < 0 || e >= arr.size
    return -1
  end

  mid_index = ((s+e)/2).floor
  mid_value = arr[mid_index]

  if mid_index == mid_value
    return mid_index
  end

  # search_left
  left_index = [mid_index-1, mid_value].min
  left = bsfind_magic_nd(arr, s, left_index)
  if left >= 0
    return left
  end

  # search_right
  right_index = [mid_index+1, mid_value].max
  right = bsfind_magic_nd(arr, mid_index+1, e)
  return right
end



farr = [0,1,2,4]
farr2 = [1,2,3,5]
arr = [0,1,2,3]

p ifind_magic(farr)
p ifind_magic(farr2)
p ifind_magic(arr)

p bsfind_magic(farr)
p bsfind_magic(farr2)
p bsfind_magic(arr)

p bsfind_magic_soln(farr, 0, farr.size-1)
p bsfind_magic_soln(farr2, 0, farr2.size-1)
p bsfind_magic_soln(arr, 0, arr.size-1)



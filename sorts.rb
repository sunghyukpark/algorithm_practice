arr = [1,59,3,5,6,90,34,2,7]

# Bubble Sort
# - add function : swap
# - invariant : after m iterations throughout the entire array, the rightmost m elements are sorted
# - time complexity : (n-1)(n-2) = O(n^2)
# - space comlexity : O(1)
def bubble_sort(arr)
  len = arr.length
  return if len==1

  # n-1 runs at most - guaranteed sorting
  for i in 0..len-1
    # single run
    for j in 0..len-2
      swap(arr,j,j+1) if arr[j] > arr[j+1]
    end
  end
  return arr
end

def swap(arr, i,j)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
  return
end



# Selection Sort
# - input: array of numbers
# - output: array of numbers
# - time complexity : O(n^2)
# - (n-1) + (n-2) + ... + 2 + 1 = n(n-1)/2
# - select min in unsorted list sequentially
# - if array is sorted : no way to know that info, repeat exactly the same
def selection_sort(arr)
    for i in 0..arr.length-2
        min = i
        for j in i+1..arr.length-1
            if arr[j] < arr[min] 
                min = j
            end
        end
        swap(arr,i,min) if min != i
    end

    return arr
end

unsorted = [11,3,4,55,6,100,1,23]
print "Selection sort: "
print selection_sort(unsorted)


# Insertion Sort
# - time complexity : O(n^2)
# - if array is already sorted : best case omega(n)
# - moving through sorted portion : right to left
# - moving through unsorted portion : left to right
def insertion_sort(arr)
  len = arr.length
  for i in 0..len-1
    j = i
    while (j > 0 && arr[j-1] > arr[j])
      swap(arr,j,j-1)
      j = j-1
    end
  end
  return arr
end


# Quick Sort
# - pivot & partition
# - helper function : partition
# - divide and conquer
# - time complexity : O(n^2), average : O(nlogn)
# - using randomized version of quicksort, worst case time complexity almost always avoided
# - in-place sorting algorithm
def quick_sort(arr, s, e)
  return if s >= e
  pIndex = partition(arr, s, e)
  quick_sort(arr,s,pIndex-1)
  quick_sort(arr,pIndex+1, e)
end

def partition(arr, s, e)
  pivot = arr[e]
  pIndex = s
  for i in s..e-1
    if arr[i] <= pivot
      swap(arr, i,pIndex)
      pIndex = pIndex + 1
    end
  end
end


# Merge Sort
# - helper function : merge
# - time complexity : O(nlogn)
# - space complexity : O(n)
# - not in place algorithm
def merge_sort(arr)
  n = arr.length
  return if n < 2  # base case for recursion
  mid = (n / 2).floor
  left = Array.new(mid)
  right = Array.new(n-mid)

  for i in 0..mid-1
    left[i] = arr[i]
  end
  for j in mid..n-1
    right[j] = arr[j]
  end

  merge_sort(left)
  merge_sort(right)
  merge(left, right, arr)
end


def merge(larr,rarr, arr)
  nl = larr.length
  nr = rarr.length
  i, j, k = 0
  while (i < nl && j < nr)
    if larr[i] <= rarr[j]
      arr[k] = larr[i]
    else
      arr[k] = rarr[j]
    end
  end

  while i < nl
    arr[k] = larr[i]
  end

  while j < nr
    arr[k] = rarr[j]
  end
end



# Sorted part, Unsorted part for each sorting method
# Bubble, Selection, Insertion

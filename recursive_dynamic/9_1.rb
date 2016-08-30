# Cracking Coding Interview 9.1
# 1,2,3 hops posssible, number of ways in n total steps

def count_ways(n)
  return 0 if n < 0
  return 1 if n == 0
  count = count_ways(n-1) + count_ways(n-2) + count_ways(n-3)
  return count
end

# count_ways(2) ->
# count = count_ways(1) + count_ways(0) + count_ways(-1)
#       = 2

# Time complexity
#   - for each step, 3 recursion call -> O(3^n)

# TO MAKE IT FASTER
# Dynamic Programming - keep track of past results (memoization)

def dyn_count_ways(n, count_arr)
  return 0 if n < 0
  return 1 if n ==0
  return count_arr[n] if count_arr[n] != nil
  count_arr = count_ways(n-1) + count_ways(n-2) + count_ways(n-3)
end


arr = Array.new
p count_ways(1)
p dyn_count_ways(1, arr)

p count_ways(2)
p dyn_count_ways(2, arr)

p count_ways(3)
p dyn_count_ways(3, arr)
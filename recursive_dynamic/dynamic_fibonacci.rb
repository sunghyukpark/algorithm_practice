# get nth fibonacci number

# recursive fibonacci - top down
def td_fibo(n)
  return 1 if n <= 1
  return td_fibo(n-1) + td_fibo(n-2)
end
# runtime analysis
#   - each recursive call has two recursive call to sub problem
#   - takes O(2^n), exponential time



# memoization
# lookup should be global var
max = 100
lookup = Array.new(max, nil)

def td_memo_fibo(n)
  if lookup[n] == nil
    if n <= 1
      lookup[n] = n
    else
      lookup[n] = td_memo_fibo(n-1) + td_memo_fibo(n-2)
    end
  end
  return lookup[n]
end
# runtime analysis
#   - no need to compute previous fibo if already computed



# iterative fibonacci - dynamic programming - use results from previous local calculation
def bu_fibo(n)
  return 1 if n <= 1
  fib = Array.new
  fib[0] = 1
  fib[1] = 1
  for i in 2..n
    fib[i] = fib[i-1] + fib[i-2]
  end
  fib[n]
end
# takes O(n) time


# tests
p td_fibo(4)
p bu_fibo(4)
p td_memo_fibo(4)

# compare the number of additions performed by each algorithm
# in top-down case, for every higher number iteration, we re-calculate lower_number fibonacci
# dynamic solution is faster (bottom-up)




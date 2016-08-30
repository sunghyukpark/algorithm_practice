# Given a string consisting of opening and closing parenthesis, find length
# of the longest valid parenthesis substring

# 1. Create an empty stack and push -1 to it. The first element of stack
#    is used to provide base for next valid string
# 2. Initialize result as 0.
# 3. If the char is '(' push index i to the stack
# 4. Else (if the char is ")")
#   a) Pop an item from stack (Most of the time an opening bracket)
#   b) If the stack is not empty, then find length of current valid substring
#      by taking diff between current index and top of the stack. If the current length is
#      more than result, then update the result
#   c) If stack is empty, push current index as base for next valid substring
# 5. Return result

# PUSH & POP INDEX to calculate difference

require_relative "stack"
stk = ArrayStack.new(30)

def find_longest(str)
  len = str.length
  longest = 0
  stack.push(-1)

  for i in 0.. len-1
    if str[i] == "("
      stk.push(i)
    else
      stk.pop
      if stk.is_empty
        stk.push(i)
      else
        longest = [longest, i-stk.peek].max
      end
    end
  end

  return longest
end
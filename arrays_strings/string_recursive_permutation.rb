# backtracking
# use swap and print to print all elements in a single set

def swap(char1, char2)
  temp = char1
  char1 = char2
  char2 = temp
  return
end


def permute(str, start_i, end_i) # -> array of all permutations, takes 3 inputs -> str, start(end) index
  len = str.length
  # base case
  if start_i == end_i
    p str
  else
    # permutation
    for i in start_i..end_i-1
      j=i
      swap(str,j,i)
      permute(str, i+1, end_i-1)
      swap(str,j,i)
    end
  end
end

def swap (str,i,j)
  temp = str[i]
  str[i] = str[j]
  str[j] = temp
  return
end

p permute("ABC", 0,2)

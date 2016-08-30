 # Given a number n, return a # formed from the same digits of n that is the # right after n
 # 1324 => 1342

def find_next_number(n)
  n_str = n.to_s
  len = n_str.length
  return "Number should have at least 2 digits" if len <= 1

  for i in (len-1).downto(1)
    if n_str[i] > n_str[i-1]
      break
    end
  end

  # case of 4321
  if i == 1
    p "Next number is not possible"
    return
  end

  number = n_str[i-1]
  smallest = i

  for j in i..len-1
    if (n_str[j] > number && n_str[j]< n_str[smallest])
      smallest = j
    end
  end

  swap(n_str, i-1, smallest)
  merge_sort(n_str[smallest+1..-1])
end


# function swaps number (with index i,j) in a string
def swap(n_str,i,j)
  temp = n_str[i]
  n_str[i] = n_str[j]
  n_str[j] = temp
  return
end

def merge_sort(n_str)
  # do merge sort
end








# 123456784987654321
# start with a number

# 123456784 987654321
#          ^the first place where the left-digit is less-than the right-digit is here.
#          Digit "x" is 4

# 123456784 987654321
#               ^find the smallest digit larger than 4 to the right

# 123456785 4 98764321
#         ^place it to the left of 4

# 123456785 4 12346789
# 123456785123446789
#          ^sort the digits to the right of 5.  Since all of them except
#          the '4' were already in descending order, all we need to do is
#          reverse their order, and find the correct place for the '4'
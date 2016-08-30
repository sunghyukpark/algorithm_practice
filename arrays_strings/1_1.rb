# Implement an algorithm to determine if a string has all unique chars. What
# if cannot use additional data structure

# Questions
#   1.ASCII and Unicode
#     If we assume ASCII - 128 chars in total
#   2. All in lowercase?

# Brute Force
# O(n^2) time complexity
def unique_chars?(str)
  len = str.length
  return true if len == 1
  return false if len > 128
  unique = true

  for i in 0..len-2
    for j in i+1..len-1
      if str[i] == str[j]
        unique = false
      end
    end
  end

  return unique
end


# Using Array and index
# O(n) time complexity
# O(1) space - array of size 128(constant)
def arr_unique_chars?(str)
  len = str.length
  return true if len == 1
  return false if len > 128
  unique = true
  chars = Array.new(128, nil)

  for i in 0..len-1
    if chars[str[i].ord]
      unique = false
    end
    chars[str[i].ord] = true
  end

  return unique
end


str = "car"
str2 = "tree"
str3 = "advertise"

p unique_chars?(str) == true
p unique_chars?(str2) == false
p unique_chars?(str3) == false

p arr_unique_chars?(str) == true
p arr_unique_chars?(str2) == false
p arr_unique_chars?(str3) == false
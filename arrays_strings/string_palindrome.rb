def is_palindrome?(str)
  return true if str.length <= 1

  start_index = 0
  end_index = str.length - 1

  while start_index < end_index
    start_index += 1 unless is_alpha?(str[s])
    end_index += 1 unless is_alpha?(str[e])

    if str[start_index] == str[end_index]
      start_index += 1
      end_index -= 1
    else
      return false
    end
  end

  return true
end

def is_alpha?(char)
  char.match(/[A-z]/) != nil
end

str = "aabbaa"
p is_palindrome?(str) # true

# problem with two special chars in a row
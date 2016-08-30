# Given an array of words, print all anagrams together
# Hashing mechanism - modulo sum of chars

# for each word in array
#   convert to return value of hash function (save in new_array)
# endfor
# sort new_array
# compare ith and i+1th same => print
class Word
  attr_reader :index

  def initialize(str, index)
    @str = str
    @index = index
  end
end

def print_all_anagrams(word_str_arr)
  hash_arr = []
  word_str_arr.each do |word_str|
    word = Word.new(word_str, hashing(word_str))
    hash_arr.push(word)
  end

  #sort hash_arr - use mergesort later
  h_len = hash_arr.length
  count_hash = Hash.new(0)
  new_arr = []

  for i in 0..h_len-1
    count_hash[hash_arr[i].index] += 1
  end

  count_hash.each do |key, value|
    if value >=2
      # print Word.str in hash_arr where Word has value over
    end
  end

end


def hashing(str)
  sum = 0
  bytes_arr = str.bytes
  bytes_arr.each do |byte|
    sum += byte
  end
  return sum % 17
end

arr = ["cat", "atc", "act", "ball", "bounce"]
print_all_anagrams(arr)
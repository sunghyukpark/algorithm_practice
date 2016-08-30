# ignoring space and punctuation - iterate to delete space and special char
# downcase both string
# for every char (except special chars or space), hash table (key, value) = (char, char_count)
# iterate over first str - make hash table
# iterate over second str - make hash table
# compare count for each hash table

def is_anagram?(str1, str2)
  str1.downcase!
  str2.downcase!
  length1 = str1.length
  length2 = str2.length

  hash1 = Hash.new
  hash2 = Hash.new

  is_anagram = true

  i = 0
  while i < length1
    i += 1 unless is_char?(str1[i])
    hash1[str1[i]] = 0 if !hash1.has_key?(str1[i])
    hash1[str1[i]] += 1
    i += 1
  end

  j = 0
  while j < length2
    j += 1 if !is_char?(str2[j])
    hash2[str2[j]] = 0 if !hash2.has_key?(str2[j])
    hash2[str2[j]] += 1
    j += 1
  end
  hash1 == hash2
end


def is_char?(char)
  char.match(/[A-z]/) != nil
end


p is_anagram?("cat", "cat ")   # true
p is_anagram?("Ca..t", "cat")  # true
p is_anagram?("holy", "holyc") # false
p is_anagram?("pip", "ipp")    # true

# problem with two special chars in a row
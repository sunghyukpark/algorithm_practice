# Given two strings, write a method to decide if one is a permutation of the other

def is_permute?(str1,str2)
  len1 = str1.length
  len2 = str2.length
  return false if len1 == 0 || len2 == 0 || len1 != len2
  str1.downcase!
  str2.downcase!

  chars1 = Array.new(128, 0)
  chars2 = Array.new(128, 0)

  for i in 0..len1-1
    chars1[str1[i].ord] += 1
    chars2[str2[i].ord] += 1
  end

  chars1 == chars2
end

str1 = "car"
str2 = "acr"

str3 = "tree"
str4 = "trea"

p is_permute?(str1,str2) == true
p is_permute?(str3,str4) == true

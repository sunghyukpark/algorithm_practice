# Write a method to compute all permutations of a string of unique characters
# ex) car -> acr, arc, car, cra, rac, rca
# ex2) name ->

# last character, suppose e.
# nam left. fix m
# na left. fix a
# n left.

# arr contain all permutations of a string
# Backtracking
# Not working

class Permutation
  attr_accessor :arr

  def initialize
    @arr = Array.new
  end

  def permute(str, s, e)
    if s == e
      @arr << str
    else
      for i in s..e
        swap(str,s,i)
        permute(str,s+1,e)
        swap(str,s,i)
      end
    end
  end

  # swap element of index i and j in string str
  def swap(str,i,j)
    temp = str[i]
    str[i] = str[j]
    str[j] = temp
    return
  end
end

ex = Permutation.new
str = "abc"
ex.permute(str,0,str.length-1)
p ex.arr

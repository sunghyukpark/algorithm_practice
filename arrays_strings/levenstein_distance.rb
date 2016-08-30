# Edit distance
# Levenshtein distance
# for all i and j, d[i,j] will hold the Levenshtein distance between
# the first i characters of s and the first j characters of t;
# note that d has (m+1)*(n+1) values
# from wikipedia

def levenshtein_distance(word1, word2)
  len1 = word1.length
  len2 = word2.length

  # init: deletion only case
  for i in 0..lenl
    d[i][0] = i
  end

  # init: insertion only case
  for j in 1..len2
    d[0][j] = j
  end

  for j in 1..len2
    for i in 1..len1
      if word1[i] == word2[j] # same as distance until index-1 chars
        d[i][j] = d[i-1][j-1]
      else
        [ d[i-1][j]+1, # deletion
          d[i][j-1]+1, # insertion
          d[i-1][j-1]+1 #substitution
        ].min
      end
    end
  end
end


# Recursive
def levenshtein_recursive(word1, word2)
  w1_length = word1.length
  w2_length = word2.length

  return w2_length if w1_length == 0
  return w1_length if w2_length == 0

  delta = 0
  if word1[-1] != word2[-1]
    delta = 1
  end

  return [ levenshtein_recursive(word1[-1], word2[-1]) + delta,
           levenshtein_recursive(word1[-1], word2[w2_length-2]) + 1,
           levenshtein_recursive(word1[w2_length-2], word2[-1]) +1
         ].min
end




# Extra note
# Hamming distance
# for X,Y of equal length, min # of subs needed to turn one into the other
def hamming_distance(word1, word2)
  counter = 0
  for i in 0..word1.length-1
    counter += 1 if word1[i] != word2[i]
  end
  counter
end


# if |x| = |y|, relationship betw hamming, edit distance
#   edit_dist <= hamming_dist (2 additional operations: deletion, insertion)

# if |x| != |y|
#   edit_dist >= ||x|-|y||



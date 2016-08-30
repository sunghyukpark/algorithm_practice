def fill_dup_count(str)
  len = str.length
  return false if len == 0
  str.downcase!
  count_hash = Hash.new

  for i in 0..len-1
    count_hash[str[i]] = 0 unless count_hash.has_key?(str[i])
    count_hash[str[i]] += 1
  end
  count_hash
end

def print_dup(str)
  count_hash = fill_dup_count(str)
  count_hash.each do |key, value|
    if value > 1
      p "#{key} has #{value} chars in string"
    end
  end
end


p "apple"
print_dup("apple")
p
p "abs"
print_dup("abs")


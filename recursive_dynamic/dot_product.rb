# array of vector instances

class Vector
  attr_accessor :index, :value

  def initialize(index, value)
    @index = index
    @value = value
  end

  # brute force iteration
  def self.brute_dot_product(arr1, arr2)
    len1 = arr1.length
    len2 = arr2.length
    sum = 0
    for i in 0..len1-1
      for j in 0..len2-1
        if arr1[i].index == arr2[j].index
          sum += (arr1[i].value * arr2[j].value)
        end
      end
    end
    return sum
  end
  # O(n^2) time complexity

  def self.dynamic_dot_product(arr1,arr2)
    len1 = arr1.length
    len2 = arr2.length
    sum = 0
    counter1 = 0
    counter2 = 0
    long = [len1, len2].max

    while counter1 < long && counter2 < long
      if arr1[counter1].index > arr2[counter2].index
        counter2 += 1
      elsif arr1[counter1].index < arr2[counter2].index
        counter1 += 1
      else
        sum += (arr1[counter1].value * arr2[counter2].value)
        counter1 += 1
        counter2 += 1
      end
    end
    return sum
  end
end

# arr1[1].value * arr2[2].value + arr1[2].value * arr[3].value

v1 = Vector.new(1,35)
v2 = Vector.new(5,2)
v3 = Vector.new(7,4)
v4 = Vector.new(128,9)

vv1 = Vector.new(2,4)
vv2 = Vector.new(3,3)
vv3 = Vector.new(5,1)
vv4 = Vector.new(7,4)

arr1 = [v1,v2,v3,v4]
arr2 = [vv1,vv2,vv3,vv4]

p Vector.brute_dot_product(arr1,arr2)
p Vector.dynamic_dot_product(arr1,arr2)
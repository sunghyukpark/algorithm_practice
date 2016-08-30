# prints element through traversing inwards
# dir 0,1,2,3 -> go right, go bottom, go left, go up
# 2D Array as an input
# returns result


class SpiralTraverse

  def initialize(twod_arr)
    @twod_arr = twod_arr
    @result = []
  end

  def traverse_top_left_to_right
    num_row = @twod_arr.length
    num_col = @twod_arr[0].length
    top = 0
    bottom = num_row - 1
    left = 0
    right = num_col - 1
    dir = 0

    while top <= bottom && left <= right
      if dir == 0
        for i in left..right
          @result << @twod_arr[top][i]
        end
        top += 1
        dir = 1
      elsif dir == 1
        for i in top..bottom
          @result << @twod_arr[i][right]
        end
        right -= 1
        dir = 2
      elsif dir == 2
        for i in right.downto left
          @result << @twod_arr[bottom][i]
        end
        bottom -= 1
        dir = 3
      else
        for i in bottom.downto(top)
          @result << @twod_arr[i][left]
        end
        left += 1
        dir = 0
      end
    end
    @result
  end

  # dir 0,1,2,3 -> down, left, up, right
  def traverse_top_right_to_bottom
    num_row = @twod_arr.length
    num_col = @twod_arr[0].length
    top = 0
    bottom = num_row -1
    left = 0
    right = num_col -1
    dir = 0

    while top <= bottom && left <= right
      if dir == 0
        for i in top..bottom
          @result << @twod_arr[i][right]
        end
        right -= 1
        dir = 1
      elsif dir == 1
        for i in right.downto(left)
          @result << @twod_arr[bottom][i]
        end
        bottom -= 1
        dir = 2
      elsif dir == 2
        for i in bottom.downto(top)
          @result << @twod_arr[i][left]
        end
        left += 1
        dir = 3
      else
        for i in left..right
          @result << @twod_arr[top][i]
        end
        top += 1
        dir = 0
      end
    end
    @result
  end
end


sample = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]
st = SpiralTraverse.new(sample)
# p st.traverse_top_left_to_right
p st.traverse_top_right_to_bottom

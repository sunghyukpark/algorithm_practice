# def max_stock_profit_dynamic(arr)
#   len = arr.length
#   return 0 if len == 0

#    # set profit to zero
#   profit = 0

#   # set first element of array as minimum (local)
#   min_price = arr[0]

#   for i in 1..len-1
#     min_price = [arr[i], min_price].min
#     profit = [profit, arr[i] - min_price].max
#   end

#   return profit
# end

def max_profit(arr)
  return 0 if arr.length ==0
  len = arr.length

  # initialize price & profit
  min_price = arr[0]
  profit = 0

  # iterate over arr, update price and profit
  for i in 1..len-1
    min_price = [arr[i], min_price].min
    profit = [arr[i] - min_price,profit].max
  end

  return profit
end

stock_arr = [1,3,5,2,4]
stock_arr_2 = [1,10,100,0,23]
stock_arr_3 = [0, 10, 3, 15, 2]
p max_profit(stock_arr) == 4
p max_profit(stock_arr_2) == 99
p max_profit(stock_arr_3) == 15






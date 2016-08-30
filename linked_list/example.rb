puts "Is your number greater than 64"
number = gets.chomp
guess = 64
i = 0
while i < 7
  if number != "y" && number != "n"
    puts "Answer should be 'y' or 'n'"
    puts "Is your number greater than #{guess}?"
  elsif number == "y"
    guess = guess + (1/2)*guess
    i++
  else
    guess = guess/2
    i++
  end
end






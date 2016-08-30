# use stack to keep track of opening parens
# not using lib push and pop function
# stack - Last In First Out
require_relative "stack"

def valid_parens?(str)
  stack = ArrayStack.new(30)
  length = str.length
  for i in 0..length-1
    if(str[i] == "[" || str[i] == "(" || str[i] == "{")
      stack.push(str[i])
    end
    if(str[i] == "]" || str[i] == ")" || str[i] == "}")
      check_stack(stack, str[i])
    end
  end
end


def get_open_parens(parens)
  return "{" if parens == "}"
  return "[" if parens == "]"
  return "(" if parens == ")"
end


def check_stack(stack, parens)
  if stack.pop != get_open_parens(parens)
    return false
  else
    return true
  end
end




# Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
#
# Linear Time/Space solution
# Subproblem = longest valid parenthesis that end at this index(not original problem)
# Because we know the longest valid parenthesis is contained in some substring, 
# we know that it must end somewhere, meaning the max possible valid parens sequence 
# will be the max of all the longest paren sequences that end at each index
#
# We can calculate the longest paren sequence for any index by only looking at 3 different indices max in dp_array
# we need to look at: immediate previous solution, the element that started the immediate previous solution, 
# and the element before the element that started the previous solution
# 

def longest_valid_parentheses(s)
  dp_arr = Array.new(s.length + 1){ 0 }
  max = 0

  s.each_char.with_index do |char, i|
    if char == '('
      dp_arr[i] = 0
    else
      next if i == 0
      if s[i - 1] == '('
        dp_arr[i] = dp_arr[i - 2] + 2
      else
        previous_len = dp_arr[i - 1]
        opening_char_idx = i - previous_len - 1

        if s[opening_char_idx] == '(' && opening_char_idx >= 0
          dp_arr[i] = dp_arr[i - 1] + 2 + dp_arr[opening_char_idx - 1]
        end
      end

      max = [dp_arr[i], max].max
    end
  end

  max
end
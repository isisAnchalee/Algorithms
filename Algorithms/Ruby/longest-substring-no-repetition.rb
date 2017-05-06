require 'pry'

# Given a string, find the length of the longest substring without repeating characters.

# Examples:
# Given "abcabcbb", the answer is "abc", which the length is 3.
# Given "bbbbb", the answer is "b", with the length of 1.
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
  string_length = s.length
  return string_length if string_length <= 1

  temp = ''
   max = 0
     i = 0

   while (i < string_length) do
    current_char = s[i]
    index = temp.index(current_char)

    if (!index)
      i += 1
      temp += current_char
      max = [max, temp.length].max
    else
      temp = temp[(index + 1)... temp.length]
    end
  end

  max
end

puts "result: #{length_of_longest_substring('pwwkew')}"


# Lexigraphical Permutations = Anagrams
#
# there are n! permitations of size n
# takes O(n*(n!)) to build
#
# 
# final permutation = reverse of sorted input string
# walk right -> left 
# keep walking until you find the first element smaller than the element to its right
# once you find that item, that's the item you're going to swap
# then you start on the right side of the array and you look for the first element greater than the item you found earlier
# you swap those two, then reverse everything remaining after the index of the element you swapped
#

def sorted_permutations(str)
  str = str.chars.sort.join
  reverse = str.reverse

  while str != reverse
    i = str.length - 1
    while i > 0
      char = str[i]
      next_char = str[i - 1]

      if char > next_char
        swap_ind = i - 1
        break
      end
      i -= 1
    end

  right_idx = -1

  (str.length - 1).downto(swap_ind + 1) do |i|
    if str[i] > str[swap_ind]
      right_idx = i
      break
    end
  end

  str[right_idx], str[swap_ind] = str[swap_ind], str[right_idx]
  reverse_in_place(str, swap_ind + 1, str.length - 1)
  puts "#{str}"
  end

  puts "#{counter}"
end

def reverse_in_place(str, start, ending)
  while start < ending
    str[start], str[ending] = str[ending], str[start]
    start += 1
    ending -= 1
  end

  str
end

puts sorted_permutations("12345")
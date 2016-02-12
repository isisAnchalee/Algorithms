# Calculate the square root of a number without 
# O(n) if n is an integer then n is actually the number of bits being used
# 'pseudo-polynomial' = exponential
# 100000 = 64 = 2**6 = log2(64) = 6 = opposite of exponentiation
# the number of bits to represent a number are log2(number)
# my number in bits is log2(number)
# linear in the number of steps because there are log2(number) bits, and the 
# logarithmic in the number[magnitude of the input] represented by the input
# linear in size of the input[in bits]
# number of bits is the log base 2 representation of the number

def calculate_square_root(num)
  upper_bound = num / 2
  lower_bound = 0

  while lower_bound <= upper_bound
    midpoint = (upper_bound + lower_bound) / 2
    square = midpoint * midpoint
    if square > num 
      upper_bound = midpoint
    elsif square < num
      lower_bound = midpoint
    else
      return midpoint 
    end

    return midpoint if square < num && (midpoint + 1)**2 > num
  end
end

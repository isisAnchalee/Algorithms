# Find XOR of two number without using XOR operator
#
# Given two integers, find XOR of them without using XOR operator, i.e., without using ^.
#
# Examples:
# Input:  x = 1, y = 2
# Output: 3
#
# Input:  x = 3, y = 5
# Output: 6
#
# A Better Solution can find XOR without using loop.
#
# 1) Find bitwise OR of x and y (Result has set bits where either x has set or y has set bit). OR of x = 3 (011) and y = 5 (101) is 7 (111)
#
# 2) To remove extra set bits find places where both x and y have set bits. The value of expression “~x | ~y” has 0 bits wherever x and y both have set bits.

# 3) bitwise AND of “(x | y)” and “~x | ~y” produces the required result.

# Best version

def xor(x, y)
  (x | y) & (~x | ~y)
end

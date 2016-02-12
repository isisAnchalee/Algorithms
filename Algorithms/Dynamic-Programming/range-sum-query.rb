# Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
#
# Example:
# Given nums = [-2, 0, 3, -5, 2, -1]
#
# sumRange(0, 2) -> 1
# sumRange(2, 5) -> -1
# sumRange(0, 5) -> -3
#
# Time Complexity: O(n)
# Space Complexity: O(n)
#

class RangeSum
  def initialize(arr)
    @arr = arr
    @summed_list = []
    sum_array_values
  end

  def sum_array_values
    @summed_list.push(@arr[0]) if @arr.length >= 1

    (1...@arr.length).each do |i|
      @summed_list.push((@summed_list[i - 1] + @arr[i]))
    end
  end

  def sum_range(i, j)
    sum = @summed_list[j]
    sum -= @summed_list[i - 1] if i >= 1

    sum
  end
end

test = RangeSum.new([-2, 0, 3, -5, 2, -1])

p test.sum_range(2, 5)


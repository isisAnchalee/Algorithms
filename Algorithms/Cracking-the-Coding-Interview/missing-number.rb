# From an array of 0..nums.length, find the missing integer
#
# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  num = nums[nums.length - 1]
  result = ((num ** 2) + num) / 2
  nums.each do |num|
    result -= num
  end
  result 
end

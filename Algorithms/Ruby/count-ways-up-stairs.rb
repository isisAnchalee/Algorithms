# dynamic programming - O(n) time + O(n) space
def count_ways_up_stairs(steps)
	return 0 if steps < 0
	return steps if steps <= 2

	paths = []
	paths[0] = 1
	paths[1] = 1
	paths[2] = 2

	(3..steps).each do |i|
		paths[i] = paths[i - 1] + paths[i - 2] + paths[i - 3]
	end

	paths[steps]
end

# iteratively - O(n) time constant space
def count_ways_up_stairs(steps)
  return 0 if steps < 0
  return steps if steps <= 2

  paths = []
  paths[0] = 1
  paths[1] = 1
  paths[2] = 2

  (3...steps).each do |i|
    count = paths[0] + paths[1] + paths[2]
    paths[0] = paths[1]
    paths[1] = paths[2]
    paths[2] = count
  end

  paths[2]
end

# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
# The robot can only move either down or right at any point in time.
# The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
# How many possible unique paths are there?

# The robot needs to move a total of n + m - 2 steps, m - 1 of which should be moving downwards. 
# So the total number of steps should be (n+m-2) choose (m-1). This can be easily implemented using Python's factorial function

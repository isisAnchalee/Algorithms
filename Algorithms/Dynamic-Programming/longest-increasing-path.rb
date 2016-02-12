# Given an integer matrix, find the length of the longest increasing path.
# From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).
#
# Example 1:
#
# nums = [
#   [9,9,4],
#   [6,6,8],
#   [2,1,1]
# ]
#
# return 4
# The longest increasing path is [1, 2, 6, 9].
#

def longest_increasing_path(matrix)
  dp_matrix = Array.new(matrix.length){ Array.new(matrix[0].length) }
  max = 0

  (0...matrix.length).each do |i|
    (0...matrix[0].length).each do |j|
      dp_matrix[i][j] = find_best_path(matrix, dp_matrix, [i, j])
      max = [max, dp_matrix[i][j]].max
    end
  end

  max
end

def find_best_path(matrix, dp_matrix, pos)
  return dp_matrix[pos[0]][pos[1]] if dp_matrix[pos[0]][pos[1]]
  i, j = pos[0], pos[1]

  directions = [[i - 1, j], [i, j - 1], [i, j + 1], [i + 1, j]]

  directions.map! do |dir|
    if in_range?(matrix, dir) && dp_matrix[dir[0]][dir[1]].nil?
      find_best_path(matrix, dp_matrix, dir) if matrix[dir[0]][dir[1]] > matrix[i][j]
    end
    in_range?(matrix, dir) && matrix[dir[0]][dir[1]] > matrix[i][j] ? dp_matrix[dir[0]][dir[1]] : 0
  end

  dp_matrix[i][j] = directions.max + 1
end

def in_range?(matrix, pos)
  pos[0].between?(0, matrix.length - 1) && pos[1].between?(0, matrix[0].length - 1)
end

nums = [
  [9,9,4],
  [6,6,8],
  [2,1,1]
]

puts longest_increasing_path(nums)

# Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
# You can only move either down or right at any point in time.

def minimum_path_sum(matrix)
  dp_matrix = Array.new(matrix.length + 1){Array.new(matrix[0].length + 1){ Float::INFINITY }}
  dp_matrix[0][1], dp_matrix[1][0] = [0, 0]

  (1..matrix.length).each do |i|
    (1..matrix[0].length).each do |j|
      dp_matrix[i][j] = [dp_matrix[i - 1][j], dp_matrix[i][j - 1]].min + matrix[i - 1][j - 1]
    end
  end
  dp_matrix.last.last
end

matrix = [[1,2],[5,6],[1,1]]

puts minimum_path_sum(matrix)

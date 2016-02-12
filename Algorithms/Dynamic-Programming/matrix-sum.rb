class CalculateMatrixSum
  attr_accessor :dp_matrix
  
  def initialize(matrix)
    @matrix = matrix
    @dp_matrix = Array.new(matrix.length + 1){ Array.new(matrix[0].length + 1){ 0 }}

    calculate_sums
  end

  def calculate_sums
    (1...@matrix.length + 1).each do |i|
      (1...@matrix[0].length + 1).each do |j|
        rect_1 = dp_matrix[i - 1][j]
        rect_2 = dp_matrix[i][j - 1]
        overlap = dp_matrix[i - 1][j - 1]
        total = @matrix[i - 1][j - 1] + rect_1 + rect_2 - overlap
        dp_matrix[i][j] = total
      end
    end
  end

  def query_matrix(x,y)
    @dp_matrix[x + 1][y + 1]
  end
end

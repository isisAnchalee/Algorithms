# A very hungry rabbit is placed in the center of of a garden, represented by a N x M 2D matrix.
# The values of the matrix will represent numbers of carrots available to the rabbit in each square of the garden. If the garden does not have an exact center, the rabbit should start in the square closest to the center with the highest carrot count.
# On a given turn, the rabbit will eat the carrots available on the square that it is on, and then move up, down, left, or right, choosing the the square that has the most carrots. If there are no carrots left on any of the adjacent squares, the rabbit will go to sleep. You may assume that the rabbit will never have to choose between two squares with the same number of carrots.
# Write a function which takes a garden matrix and returns the number of carrots the rabbit eats eg.

class CarrotSquare
  attr_reader :horizontal_pos, :vertical_pos, :carrot_value
  def initialize(horizontal_pos, vertical_pos, carrot_value)
    @horizontal_pos = horizontal_pos
    @vertical_pos = vertical_pos
    @carrot_value = carrot_value
  end
end

def calculate_maximum_pos(horizontal_mid, vertical_mid, matrix, add_adj_carrot_count = false)
    max_heap = MaxHeap.new
    adjacent_carrot_count = 0

    deltas = [
      [horizontal_mid, vertical_mid - 1],
      [horizontal_mid, vertical_mid + 1],
      [horizontal_mid - 1, vertical_mid], 
      [horizontal_mid + 1, vertical_mid]
    ]
    
    deltas.each do |i, j|
      if matrix[i][j] &&  matrix[i][j] != :seen
        max_heap.add(CarrotSquare.new(i, j, matrix[i][j]))
        adjacent_carrot_count += 1
      end
    end

    highest_square = max_heap.extract_max
    horizontal_mid = highest_square.horizontal_pos
    vertical_mid = highest_square.vertical_pos

    add_adj_carrot_count ? [adjacent_carrot_count, horizontal_mid, vertical_mid] : [horizontal_mid, vertical_mid] 
end

def trace_path_eating_carrots(matrix)
  return 'I need a matrix!' unless matrix

  #set starting position
  #if there is an exact middle
  horizontal_mid = matrix[0].length / 2
  vertical_mid = matrix.length / 2

  # else calculate highest point around middle
  unless matrix[0].length.odd? && matrix.length.odd?
    horizontal_mid, vertical_mid = calculate_maximum_pos(horizontal_mid, vertical_mid, matrix)
  end

  #matrix bounds
  top = 0
  left = 0
  right = matrix[0].length - 1
  bot = matrix.length - 1
  eaten_carrots = 0

  while (horizontal_mid >= left || horizontal_mid <= right) && (vertical_mid >= top || vertical_mid <= bot)
    #add the carrot value for the current position
    eaten_carrots += matrix[horizontal_mid][vertical_mid]

    # set pos = 'X' to signify that space has been visited
    matrix[horizontal_mid][vertical_mid] = :seen

    # move forward along the path
    adjacent_carrots, horizontal_mid, vertical_mid = calculate_maximum_pos(horizontal_mid, vertical_mid, matrix, true)

    return 'going to sleep' if adjacent_carrots == 0
  end

  eaten_carrots
end

# Find the intersection of two rectangles
#
def find_range_overlap(point1, length1, point2, length2)

  # Find the highest start point and lowest end point.
  # The highest ("rightmost" or "upmost") start point is
  # the start point of the overlap.
  # The lowest end point is the end point of the overlap.
  highest_start_point = [point1, point2].max
  lowest_end_point = [point1 + length1, point2 + length2].min

  # Return [nil, nil] if there is no overlap.
  if highest_start_point >= lowest_end_point
    return [nil, nil]
  end

  # Compute the overlap length.
  overlap_length = lowest_end_point - highest_start_point

  [highest_start_point, overlap_length]
end

def find_rectangular_overlap(rect1, rect2)
  # get the x and y overlap points and lengths
  x_overlap_point, overlap_width  = find_range_overlap(
    rect1['x'], rect1['width'], rect2['x'], rect2['width'])

  y_overlap_point, overlap_height = find_range_overlap(
    rect1['y'], rect1['height'], rect2['y'], rect2['height'])

  # return None if there is no overlap
  if !overlap_width || !overlap_height
    return None
  end

  return {
    'x': x_overlap_point,
    'y': y_overlap_point,
    'width': overlap_width,
    'height': overlap_height
  }
end

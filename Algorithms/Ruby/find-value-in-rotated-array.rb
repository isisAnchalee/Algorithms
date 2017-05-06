# Find number in rotated array in O(logn) time
# Uses Binary Search to find pivot point to do another binary search on to find the number
#
# ex. rotated array: [25, 37, 64, 10, 14, 16, 17] 15
# [10, 3, 4, 5, 7]
def find_in_rotated_array(arr, num)
  return -1 unless arr
  return nil unless num

  start_ind = 0
  end_ind = arr.length - 1
  pivot = nil

  if arr[start_ind] < arr[end_ind]
    #array is not rotated do regular binary search
  else
    while start_ind <= end_ind
      mid = (start_ind + end_ind) / 2

      if arr[mid + 1] < arr[mid]
        pivot = mid
        break
      elsif arr[start_ind] < arr[mid]
        start_ind = mid + 1
      else
        end_ind = mid - 1
      end
    end
  end

  start_ind = 0
  end_ind = arr.length

  if num > arr[pivot] && num < arr[end_ind]
    start_ind = pivot
  elsif num < arr[pivot] && num > arr[0]
    end_ind = pivot
  end

  while start_ind <= end_ind
    mid = (start_ind + end_ind) / 2

    if arr[mid] == num
      return mid
    elsif arr[mid] < num
      start_ind = mid
    else
      end_ind = mid
    end
  end

  return -1
end
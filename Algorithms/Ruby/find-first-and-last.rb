# Modify binary search to return the first and last occurence of the number

def find_first_number_occurence(arr, num)
  start_ind = 0
  end_ind = arr.length - 1
  result = -1
  mid = (start_ind + end_ind) / 2

  while start_ind < end_ind
    if arr[mid] == num
      result = mid
      end_ind = mid
    elsif arr[mid] < num
      start_ind = mid
    elsif arr[mid] > num
      end_ind = mid
    end
  end

  result
end

def find_last_number_occurence(arr, num)
  start_ind = 0
  end_ind = arr.length - 1
  result = -1
  mid = (start_ind + end_ind) / 2

  while start_ind < end_ind
    if arr[mid] == num
      result = mid
      start_ind = mid
    elsif arr[mid] < num
      start_ind = mid
    elsif arr[mid] > num
      end_ind = mid
    end
  end

  result
end

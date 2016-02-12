# Return the kth smallest element from two sorted arrays

def kth_smallest_element(k, arr1, arr2)
  i = k / 2
  j = k - i
  step = k / 4

  while step > 0
    if arr1[i - 1] > arr2[j - 1]
      i -= step
      j += step
    else 
      i += step
      j -= step
    end
    step /= 2
  end

  if arr1[i - 1] > arr2[j - 1]
    return arr1[i - 1]
  else 
    return arr2[j - 1]
  end
end

def three_sum(arr, x = 0)
  results = []
  arr.sort! { |a, b| a <=> b }

  i = 0
  while i < arr.length - 3
    if (i === 0 || arr[i] > arr[i - 1])
      start_idx = i + 1
      end_idx = arr.length - 1

      while start_idx < end_idx
        if (arr[i] + arr[start_idx] + arr[end_idx] === x)
          results.push(arr[i], arr[start_idx], arr[end_idx])
        end

        if (arr[i] + arr[start_idx] + arr[end_idx])
          current_start = start_idx
          while (arr[start_idx] == arr[current_start]) && (start_idx < end_idx)
            start_idx += 1
          end
        else
          current_end = end_idx
          while arr[end_idx] == arr[current_end]
            end_idx += 1
          end
        end
      end
    end
  end

  results
end
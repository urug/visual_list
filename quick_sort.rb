def move(arr, source_index, destination_index)
  arr.insert(destination_index, arr.delete_at(source_index))
end


def partition(arr, start_idx, end_idx)
  # pick middle point between start and end
  pivot = (end_idx - start_idx) / 2 + start_idx

  target = arr[pivot] 
     
  idx = start_idx  
  while idx <= end_idx do
    if idx < pivot
      # move value if > target.  keep idx the same, subtract 1 from pivot.  move to pivot + 1
      if arr[idx] > target
        move(arr, idx, pivot)
        pivot -= 1
      else
        idx += 1
      end
    elsif idx > pivot
      # move value if < target.  keep idx the same, add 1 to pivot. move to pivot - 1
      if arr[idx] < target
        move(arr, idx, pivot)
        pivot += 1
      else
        idx += 1
      end
    else
      idx += 1
    end
    
  end
  pivot
end

def quicksort(arr, start_idx, end_idx)
  if (end_idx - start_idx) > 0
    p = partition(arr, start_idx, end_idx)
    quicksort(arr, start_idx, p - 1)
    quicksort(arr, p + 1, end_idx)
  end
  arr
end

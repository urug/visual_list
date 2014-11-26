#!/usr/bin/env ruby
#
# Classsic quick sort
#
require_relative '../visual_list'

def partition(arr, start_idx, end_idx)
  # pick middle point between start and end
  pivot = (end_idx - start_idx) / 2 + start_idx

  target = arr[pivot]    
  
  idx = start_idx  
  while idx <= end_idx do
    if idx < pivot
      # move value if > target.  keep idx the same, subtract 1 from pivot.  move to pivot + 1
      if arr[idx] > target
        arr.move(idx, pivot)
        pivot -= 1
      else
        idx += 1
      end
    elsif idx > pivot
      # move value if < target.  keep idx the same, add 1 to pivot. move to pivot - 1
      if arr[idx] < target
        arr.move(idx, pivot)
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
end

#v = VisualList.new(generator: :linear, count: 35)
v = VisualList.new(values: [3,2,5,7,1,4,10,21,6,8])
quicksort(v, 0, v.last_index)

v.sorted!
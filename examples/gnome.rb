#!/usr/bin/env ruby
#
# Gnome sort. A variation of the cocktail shaker sort except the sort
# direction is changed as soon as a swap occurs.
#
require_relative '../visual_list'

v = VisualList.new(generator: :linear)

forward = true
sorted = false
until sorted
  incrementor = forward ? 1 : -1
  swapped = false
  iterator = if forward
    0.upto(v.last_index-1)
  else
    (v.last_index).downto(1)
  end

  iterator.each do |index|
    if forward
      if v[index] > v[index+incrementor]
        v.swap(index, index+incrementor)
        swapped = true
        forward = !forward
        break
      end
    else
      if v[index] < v[index+incrementor]
        v.swap(index, index+incrementor)
        swapped = true
        forward = !forward
        break
      end
    end
  end
  sorted = true unless swapped
  forward = !forward
end

v.sorted!
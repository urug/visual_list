#!/usr/bin/env ruby
#
# Classsic bubble sort, with restarts.
#
require_relative '../visual_list'

v = VisualList.new(generator: :linear, count: 10)

sorted = false
until sorted
  swapped = false
  0.upto(v.last_index-1).each do |index|
    if v[index] > v[index+1]
      v.swap(index, index+1)
      swapped = true
      break
    end
  end
  sorted = true unless swapped
end

v.sorted!
#!/usr/bin/env ruby
#
# Sort of a bogosort. Swap two random indexes until the list appears in order.
#
require_relative '../visual_list'

v = VisualList.new(generator: :linear, count: 10)

sorted = false
until sorted
  out_of_order = false
  0.upto(v.last_index-1).each do |index|
    if v[index] > v[index+1]
      out_of_order = true
      v.swap(rand(0..v.last_index), rand(0..v.last_index))
      break
    end
  end
  sorted = true unless out_of_order
end

v.sorted!
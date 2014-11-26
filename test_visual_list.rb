require 'minitest/autorun'
require 'minitest/spec'
require './examples/quick'


class TestVisualList < MiniTest::Spec
  def test_obj_valid
    v = VisualList.new(values: [3,2,5,7,1,4,10,21,6,8], delay: 0)
    assert(v.is_a? VisualList)
  end
  
  def test_simple_sort_works
    v = VisualList.new(values: [3,2,5,7,1,4,10,21,6,8], delay: 0)
    quicksort(v, 0, v.last_index) 
  end
  
  def test_random_sort
      (1..50).each do
        arr = source_array = rand(50).times.map {rand(20)}
        next if arr.length < 8
        v = VisualList.new(values: arr, delay: 0)
        quicksort(v, 0, v.last_index)
        
        v.sorted!
      end
    end
  
  def test_failing_sort
    arr = [0, 1, 1, 1, 1, 1, 2, 1, 2, 3, 3, 4, 3, 4, 5, 6, 7, 7, 7, 8, 8, 9, 13, 9, 13, 13, 13, 14, 14, 15, 16, 15, 16, 17, 17, 17, 17, 17, 18, 18]
    v = VisualList.new(values: arr, delay: 0)
    quicksort(v, 0, v.last_index)    
    v.sorted!
  end
  
end
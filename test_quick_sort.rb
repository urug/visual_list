require 'minitest/autorun'
require 'minitest/spec'
require './quick_sort'

class TestQuickSort < MiniTest::Spec
  def test_sort_single_item_array_returns_identity
    source_array = [1]
    retval = quicksort(source_array, 0, 0)
    assert_equal(source_array, retval)
  end
  
  def test_two_item_array_already_sorted_returns_identity
    source_array = [1,4]
    retval = quicksort(source_array, 0, 1)
    assert_equal(source_array, retval)    
  end
  
  def test_two_item_array_unsorted_returns_sorted_array
    source_array = [5,4]
    retval = quicksort(source_array, 0, 1)
    assert_equal(source_array.sort, retval)    
  end
  
  def test_three_item_array_unsorted_returns_sorted_array
    source_array = [5,4,1]
    retval = quicksort(source_array, 0, source_array.length - 1)
    assert_equal(source_array.sort, retval)    
  end
  
  def test_arbitrary_item_array_unsorted_returns_sorted_array
    source_array = [3,2,5,7,1,4,10,21,6,8]
    retval = quicksort(source_array, 0, source_array.length - 1)
    assert_equal(source_array.sort, retval)    
  end
  
  def test_randomly_generated_unsorted_arrays_returns_sorted_array
    (1..5000).each do      
      source_array = rand(50).times.map {rand(20)}
      retval = quicksort(source_array, 0, source_array.length - 1)
      
      if retval != source_array.sort
        puts source_array.inpsect
      end      
      assert_equal(source_array.sort, retval)
    end    
  end
  
  def test_failing_array
    source_array = [0, 1, 1, 1, 1, 1, 2, 1, 2, 3, 3, 4, 3, 4, 5, 6, 7, 7, 7, 8, 8, 9, 13, 9, 13, 13, 13, 14, 14, 15, 16, 15, 16, 17, 17, 17, 17, 17, 18, 18]
    retval = quicksort(source_array, 0, source_array.length - 1)
    
    if retval != source_array.sort
      puts source_array.inpsect
    end      
    assert_equal(source_array.sort, retval)
  end
  
  
end
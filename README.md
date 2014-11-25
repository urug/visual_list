# Visual List
## Test your sorting skills

The VisualList class is used for playing with sorting algorithms. It gives you
a list of unsorted number and expects you to sort them while it give you
visual feedback on the state of the list. Once you think you've got everything
sorted out (ha! see what I did there?), you can ask the class if you've got
it right.

**This code uses keyword arguments, it MUST be used with Ruby 2.0 or higher.**

## Example with bubble sort

Here is a classic bubble sort using VisualList:

```ruby
list = VisualList.new

sorted = false
until sorted
  swapped = false
  0.upto(list.last_index-1).each do |index|
    if list[index] > list[index+1]
      list.swap(index, index+1)
      swapped = true
      break
    end
  end
  sorted = true unless swapped
end

list.sorted!
```

## Methods

### .new

Returns a new VisualList object. Possible keyword arguments are:
  * count - number of items in the list (default: 10)
  * minimum - the minimum value for random generators (default: 1)
  * minimum - the maximum value for random generators (default: 10)
  * delay - the time to sleep() after displaying list (default: 0.1 seconds)
  * generator - the generator for the initial list values. Possible values:
    - :random - random values from minimum to maximum. Duplicates possible.
    - :linear - 1 to count in random order. No duplicates. Default.
    - :reversed - count down to 1 in descending order. No duplicates.

### #count

Returns the number of items in the list as an integer. Aliases are
`#size` and `#length`.

### #last_index
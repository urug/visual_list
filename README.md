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

More examples are found in the `examples/` folder.

## Methods

### .new(count: 10, generator: :linear, minimum: 1, maximum: 10, delay: 0.1)

Returns a new VisualList object. All arguments optional. Possible keyword arguments are:
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

Returns the last index of the list. Same value as `#count - 1`.

### #in_bounds?(index)

Returns true if the index passed is valid for the list, false if it is
not valid.

### #get(index)

Returns the value at `index`. If index is out-of-bounds, an exception is
raised. Alias is `[]`.

### #swap(index_a, index_b)

Swap the values between `index_a` and `index_b`. Returns true of swap was
successful. If either index is out-of-bounds, an exception is raised.

### #sorted!

Declare the list sorted. If the list is properly sorted, it returns true
and prints a message to the screen. If the list was not properly sorted,
raises an exception.

## Theory of operation

This class provides just the minimum number of method you need to sort a
list of items. Although it lets you read the value at a certain index, it
does not allow you to set values: instead, all you can do is swap the
values between two indexes.

After every `#get` or `#swap` operation, the state of the list will be
printed to the screen. In the case of a `#get`, the line that was read
will be highlighted with the `=` character. In the case of a `#swap`,
the two lines being swapped will be highlighted with the `#` character.

A count of the number of get operations and swap operations is kept, and
the total is displayed at the top of the screen.

For longer lists you will want to turn down the `delay` parameter. It accepts a float at the number of seconds to pause after printing the current state to the screen. So a delay of 0.1 seconds is one-tenth of a second, and 0.001 is one-thousandth of a second.

## Examples

Examples are found in the `examples/` folder.
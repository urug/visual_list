class VisualList
  attr_reader :count
  alias :size :count
  alias :length :count

  # Returns a new VisualList object. Possible keyword arguments are:
  #   * count - number of items in the list (default: 10)
  #   * minimum - the minimum value for random generators (default: 1)
  #   * minimum - the maximum value for random generators (default: 10)
  #   * delay - the time to sleep() after displaying list (default: 0.1 seconds)
  #   * generator - the generator for the initial list values. Possible values:
  #     - :random - random values from minimum to maximum. Duplicates possible.
  #     - :linear - 1 to count in random order. No duplicates. Default.
  #     - :reversed - count down to 1 in descending order. No duplicates.
  def initialize(count: 10, generator: :linear, minimum: 1, maximum: nil, delay: 0.1)
    @count = count.to_i.abs
    @reads = 0
    @swaps = 0
    @generator = generator
    @delay = delay
    @minimum = minimum.to_i.abs
    @maximum = (maximum || count).to_i.abs
    @values = self.send("generator_#{@generator}")
    @largest_value = @values.inject{|a,b| b > a ? a = b : a }
    clear_screen
    display_list
  end

  # Returns the last index (equal to number of items minus one).
  def last_index
    @count-1
  end

  # Return the value of a given index
  def get(index)
    @reads += 1
    in_bounds!(index)
    display_list(read_index: index)
    @values[index]
  end
  alias :[] :get

  # Swap the values of two index locations. Returns true if operation is
  # successful. Raises exception of either argument is our of list bounds.
  def swap(source_index, destination_index)
    [source_index, destination_index].each do |index|
      in_bounds!(index)
    end

    display_list(swap_index_a: source_index, swap_index_b: destination_index)

    # swap the values of the two indexes
    source_value = @values[source_index]
    @values[source_index] = @values[destination_index]
    @values[destination_index] = source_value

    @swaps += 1
    display_list(swap_index_a: source_index, swap_index_b: destination_index)

    true
  end

  # Declare the list sorted. If the list really is sorted, returns true.
  # If list is not sorted, raises exception.
  def sorted!
    if @values == @values.sort
      display_list
      puts "Success! List is sorted!"
      true
    else
      raise "Sorry, list has not been sorted."
    end
  end

  # true if index is within arrary bounds, false if not
  def in_bounds?(index)
    index.to_i > last_index
  end

private

  # Print the current state of the list to the screen.
  def display_list(read_index: nil, swap_index_a: nil, swap_index_b: nil)
    home_cursor
    puts "Reads: #{@reads}, Swaps: #{@swaps}"
    puts '-'*line_length
    @values.each_with_index do |value, index|
      char = if index == read_index
        # character for a read operation
        '='
      elsif swap_index_a == index || swap_index_b == index
        # character for a swap operation
        '#'
      else
        # normal character
        '-'
      end
      line = "#{index}\t#{char*value} #{value}"

      # clearing remainder of line
      line += ' '*(line_length-line.length)
      puts line
    end
    sleep(@delay)
  end


  # returns true if index is within bounds, otherwise raises exception
  def in_bounds!(index)
    if index.to_i > last_index
      raise 'out of bounds'
    end
  end

  def line_length
    @largest_value + 12 # for padding
  end

  # send cursor to top-left corner of screen
  def home_cursor
    print "\033[0;0f"
  end

  def clear_screen
    print "\e[2J\e[f"
  end

  def generator_already_sorted
    1.upto(@count).map{|i| i }
  end

  def generator_random
    @count.times.map{ rand(@minimum..@maximum) }
  end

  def generator_linear
    1.upto(@count).map{|i| i }.shuffle
  end

  def generator_reversed
    @count.downto(1).map{|i| i }
  end
end
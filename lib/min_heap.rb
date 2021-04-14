class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  
  # Time Complexity: O(log n)
  # >> O(1) create new HeapNode
  # >> O(1) add node to end of array
  # >> O(log n) heap_up / heap_up_helper 
  
  # Space Complexity: O(1)
  # >> O(1) (adding to an existing array) --> sometimes array may need to double, but amortized cost is O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node

    heap_up(@store.size - 1)

    return
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    raise NotImplementedError, "Method not implemented yet..."
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    raise ArgumentError, 'There is no node at this index' if @store[index].nil?
    return if index == 0

    if index % 2 == 0
      heap_up_helper(index, 2)
    else
      heap_up_helper(index, 1)
    end

    return
  end

  def heap_up_helper(index, offset)
    parent_index = (index - offset) / 2
    while @store[index].key < @store[parent_index].key && index > -1 && parent_index > -1
      swap(index, parent_index)
      index = parent_index
      parent_index = (index - offset) / 2
    end

    return
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    raise NotImplementedError, "Method not implemented yet..."
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1], @store[index_2] = @store[index_2], temp
    # @store[index_1] = @store[index_2]
    # @store[index_2] = temp
  end
end
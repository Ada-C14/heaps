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
  # Time Complexity: O(log n) - for heap_up()
  # Space Complexity: O(1)
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n) - for heap_up()
  # Space Complexity: O(1)
  def remove()
    if @store.empty?
      return nil
    end

    swap(0, @store.length - 1)
    result = @store.pop.value

    heap_down(0) unless @store.empty?
    return result
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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) - we will make log n number of comparisons
  # Space complexity: O(log n) - call stock
  def heap_up(index)
    # base case - we are at the root
    return nil if index == 0
    parent_node = (index - 1) / 2
    if @store[parent_node].key > @store[index].key
      # recursive case
      swap(parent_node, index)
      heap_up(parent_node)
    else
      # base case - we are done swapping
      return nil
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # Time complexity: O(log n) - like heap_up times two
  # Space complexity: O(log n) - call stock
  def heap_down(index)
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2
    # base case - we are at a leaf node
    return nil if left_child >= @store.length

    if @store[left_child].key < @store[index].key
      # recursive case - left node
      swap(left_child, index)
      heap_down(left_child)
    end
    if right_child < @store.length && @store[right_child].key < @store[index].key
      # recursive case - right node
      swap(right_child, index)
      heap_down(right_child)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
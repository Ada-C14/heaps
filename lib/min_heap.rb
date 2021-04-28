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
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    if @store.empty?
      return nil
    end
  
    swap(0, @store.length - 1)
    result = @store.pop
  
    heap_down(0) unless @store.empty?

    return result.value
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value.to_s + ", "
    end

    output += @store.last.value.to_s + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    @store.length == 0 ? true : false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    parent = ((index - 1) / 2)

    if index > 0 && @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    smaller_child = index

    if left_child < @store.length && @store[left_child].key < @store[smaller_child].key
      smaller_child = left_child
    end

    if right_child < @store.length && @store[right_child].key < @store[smaller_child].key
      smaller_child = right_child
    end

    if smaller_child != index
      swap(index, smaller_child)
      heap_down(smaller_child)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
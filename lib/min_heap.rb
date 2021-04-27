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
  # Time Complexity: O(log n), where n is the number of items
  # Space Complexity: O(n) 
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    return nil if @store.empty?
    swap(0, -1)
    last = @store.pop
    heap_down(0) unless @store.empty?
    return last.value
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
    if @store.length == 0
      return true
    else
      return false
    end
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    parent_i = (index - 1) / 2
    return if index == 0 || @store[parent_i].key < @store[index].key

    swap(parent_i, index)
    heap_up(parent_i)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    return if @store[left_child].nil? || @store[right_child].nil?
    if @store[left_child].key < @store[index].key
      swap(left_child, index)
    end

    if @store[right_child].key < @store[index].key
      swap(right_child, index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
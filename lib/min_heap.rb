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
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    return nil if @store.empty?

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
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    parent = (index - 1) / 2 
    if index == 0 
      return 
    elsif @store[index].key < @store[parent].key
      swap(parent, index)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_down(index)
    left_child_index = (index * 2) + 1 
    right_child_index = (index * 2) + 2 

    if left_child_index >= @store.length
      return 
    elsif @store[right_child_index] && @store[right_child_index].key < @store[left_child_index].key && @store[right_child_index].key < @store[index].key
      swap(right_child_index, index)
      heap_down(right_child_index)
    elsif @store[left_child_index].key < @store[index].key
      swap(left_child_index, index)
      heap_down(left_child_index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
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
    removed = @store.pop

    heap_down(0) unless @store.empty?

    removed.value
    
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
  # Space complexity:  O(1)
  def empty?
    @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than its parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    parent = (index - 1 ) / 2

    if index == 0
      return
    elsif @store[index].key < @store[parent].key
      swap(parent,index)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2

    if left_child >= @store.length
      return
    elsif @store[right_child] && @store[right_child].key < @store[left_child].key && @store[right_child].key < @store[index].key
      swap(right_child, index)
      heap_down(right_child)
    elsif @store[left_child].key < @store[index].key
      swap(left_child, index)
      heap_down(left_child)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
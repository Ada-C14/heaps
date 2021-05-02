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
  # Time Complexity: log n
  # Space Complexity: log n
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: log n
  # Space Complexity: log n
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
  # Time complexity: 1
  # Space complexity: 1
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: log n
  # Space complexity: log n
  def heap_up(index)
    return nil if index == 0
    parent = (index - 1) / 2
    if @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # Time complexity: log n
  # Space complexity: log n
  def heap_down(index)
    left = (index * 2) + 1
    right = (index * 2) + 2

    return @store if @store[left].nil?
    return nil if left >= @store.length
    
    if @store[left].key < @store[index].key
      # recursive case - left node
      swap(left, index)
      heap_down(left)
    end
    if right < @store.length && @store[right].key < @store[index].key
      # recursive case - right node
      swap(right, index)
      heap_down(right)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
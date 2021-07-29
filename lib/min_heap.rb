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
  # Space Complexity: O(log n) - n
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
    result = @store.pop.value

    unless @store.empty?
      heap_down(0)
    end

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
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    head = (index - 1) / 2

    if index <= 0 || @store[head].key <= @store[index].key
      return
    elsif @store[index].key < @store[head].key
      swap(head, index)
      heap_up(head)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left = (index * 2) + 1
    right = (index * 2) + 2

    return if left >= @store.length - 1

    if @store[right].key < @store[left].key && @store[right].key < @store[index].key
      swap(right, index)
      heap_down(right)
    elsif @store[left].key < @store[index].key
      swap(left, index)
      heap_down(left)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
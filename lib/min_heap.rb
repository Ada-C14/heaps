class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap
  attr_reader :store

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def add(key, value = key)
    new_i = @store.length
    @store[new_i] = HeapNode.new(key, value)
    heap_up(new_i)
    return key
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def remove()
    value = @store[0].value

    swap(0, -1)
    @store.delete_at(-1)
    heap_down(0)
    return value
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
  # Time complexity: O(0)
  # Space complexity: O(0)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(0)
  def heap_up(index)
    while index > 0 && @store[index].key < @store[(index - 1)/2].key
      swap(index, (index - 1)/2)
      index = (index - 1)/2
      return if index == 0
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    if @store[index * 2 + 1] != nil
      while @store[index].key > @store[index * 2 + 1].key
        swap(index, index * 2 + 1)
        swap(index, index * 2 + 2) if @store[index * 2 + 2] != nil && @store[index].key > @store[index * 2 + 2].key
        index = index * 2 + 1
        return if @store[index * 2 + 1].nil?
      end
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
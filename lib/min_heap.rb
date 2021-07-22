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
  # Space Complexity: O(1)
  def add(key, value)
    node = HeapNode.new(key, value)
    @store << node
    heap_up(@store.length-1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    return nil if @store.empty?
    swap(0, @store.length-1)
    removed = @store.pop 
    heap_down(0)
    return removed.value
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
  # Time complexity: O(n)
  # Space complexity: O(1)
  def empty?
    @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(n)
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0

    parent = (index - 1) / 2

    if @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left = index * 2 + 1
    right = index * 2 + 2

    if right < @store.length
      min = @store[left].key < @store[right].key ? left : right
      if @store[index].key > @store[min].key
        swap(index, min)
        heap_down(min)
      end
    elsif left < @store.length && @store[index].key > @store[left].key
      swap(index, left)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
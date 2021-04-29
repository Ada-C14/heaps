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
  # Time Complexity: O(log(n))
  # Space Complexity: O(log(n) due to the stack call in heap_up, could be O(1) using a loop
  def add(key, value = key)
    node = HeapNode.new(key, value)
    @store.push(node)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log(n)) - where n is the number of elements and log(n) reps the levels
  # Space Complexity: O(log(n) due to the stack call in heap_down, could be O(1) using a loop
  def remove()
    if @store.length == 0
      raise "the heap is empty"
    end

    swap(0, @store.length - 1)
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
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log(n)) - n for number of elements. log(n) represents the number of levels. 
  # Space complexity: O(log(n)) - the stack for the resursive calls could be as tall as the number of levels. 
  def heap_up(index)
    return if index == 0
    parent_idx = (index - 1) / 2
    if @store[parent_idx].key > @store[index].key
      swap(parent_idx, index)
      heap_up(parent_idx)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left = 2 * index + 1
    right = 2 * index + 2
    if @store[left] && @store[right] # if both left and right are not nil 
      child_idx = @store[left].key > @store[right].key ? right : left
    elsif @store[left] # there's no case where the left would be null and the right have a value
      child_idx = left
    else # if they're both null stop the function and return. 
      return 
    end

    if @store[child_idx].key < @store[index].key
      swap(child_idx, index)
      heap_down(child_idx)
    end

      
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
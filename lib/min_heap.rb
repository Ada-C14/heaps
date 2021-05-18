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
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    raise NotImplementedError, "Method not implemented yet..."
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
    return true if @store.length == 0
  end

  private

  # The heap up method takes an index and
  #  moves it up the heap, if it is less than its parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    return @store if index == 0 
    
    parent_index = (index - 1)/2
    return @store if @store[index].key >= @store[parent_index].key
    
    if @store[index].key < @store[parent_index].key
      swap(parent_index,index)
      heap_up(parent_index)
    end

  end

  # The heap down method takes an index and 
  #  moves it DOWN the heap if it's larger
  #  than its parent node
  # Time complexity: O(log n)
  # Space complexity: O(log n)

  def heap_down(index)
    return @store if index == 0

    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2

    if @store[index].key > left_child_index
      swap(left_child_index,index)
      heap_down(left_child_index)
    elsif @store[index].key > right_child_index
      swap(right_child_index,index)
      heap_down(right_child_index)
    else
      return @store
    end

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
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

  def last_index
    @store.length - 1
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n). Pushing O(1) && heap_up O(log n)
  # Space Complexity: O(log n) 
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    
    heap_up(last_index)
  end

  # This method removes and returns an element from the heap
  # maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    return nil if @store.empty?

    swap(0, last_index)
    result = @store.pop
    heap_down(0) 

    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (last_index).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return true if @store.empty?
  end

  private
  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    parent_index = (index -1 ) / 2 

    child = @store[index]
    parent = @store[parent_index]

    if parent.key > child.key
      swap(index, parent_index)

    return if parent_index == 0
     heap_up(parent_index)
    end
  end 

  # This helper method takes an index and 
  # moves it up the heap if it's smaller
  # than it's parent node.
  # Time complexity: O(log n)
  # Time complexity: O(log n)

  def heap_down(index)
    left_child_index = index * 2 + 1
    right_child_index = index * 2 + 2

    return if left_child_index > last_index

    if @store[left_child_index].key < @store[index].key
      if @store[right_child_index] && @store[right_child_index].key < @store[index].key
        minimum = @store[left_child_index].key <= @store[right_child_index].key ? left_child_index : right_child_index
        swap(index, minimum)
        heap_down(minimum)
      else
        swap(index, left_child_index)
        heap_down(left_child_index)
      end
    end
    return
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
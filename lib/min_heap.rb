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
    # raise NotImplementedError, "Method not implemented yet..."
    heap_node = HeapNode.new(key, value)
    @store << heap_node
    heap_up(@store.length - 1)

  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n) 
  def remove()
    # raise NotImplementedError, "Method not implemented yet..."
    if @store.empty?
      return nil
    end

    swap(0, @store.length - 1)

    removed_node = @store.pop
    heap_down(0) unless @store.empty?

    return removed_node.value
    
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
    # raise NotImplementedError, "Method not implemented yet..."
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    parent_node = (index - 1 ) / 2

    if @store[parent_node].key > @store[index].key
      swap(parent_node, index)

      if parent_node > 0 
        return heap_up(parent_node)
      end
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # raise NotImplementedError, "Method not implemented yet..."
    left = index * 2 + 1
    right = index * 2 + 2
    min = left

    if left >= @store.length    
      return
    end

    if right < @store.length && @store[right].key < @store[left].key
      min = right
    end

    if @store[index].key < @store[min].key
      return 
    end 

    swap(index, min)
    heap_down(min)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
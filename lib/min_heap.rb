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
  # Time Complexity: O(nlogn)
  # Space Complexity: O(nlogn)
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(nlogn)
  # Space Complexity: O(nlogn)
  def remove()
    return nil if @store.empty? 
    swap(0, @store.length - 1)
    result = @store.pop.value
    
    heap_down(0) unless @store.empty?
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
  # Time complexity: O(nlogn)
  # Space complexity: O(nlogn)
  def heap_up(idx)
    parent_idx = (idx - 1) / 2
    return if idx <= 0 || @store[parent_idx].key <= @store[idx].key
    swap(parent_idx, idx)
    heap_up(parent_idx)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # Time complexity: O(nlogn)
  # Space complexity: O(nlogn)
  def heap_down(idx)
    
    left_idx = (idx * 2) + 1
    right_idx = (idx * 2) + 2
    smaller_idx = idx 

    smaller_idx = left_idx if @store[left_idx] && @store[left_idx].key < @store[smaller_idx].key
      
    smaller_idx = right_idx if @store[right_idx] && @store[right_idx].key < @store[smaller_idx].key 

    if (smaller_idx != idx)
      swap(idx, smaller_idx)
      heap_down(smaller_idx)
    end
    
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
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
  # Space Complexity: O(log n) - potential stack call for heap_up
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n) - potential head_down stack call
  def remove()
    return nil if @store.empty?

    last_index = @store.length - 1
    swap(0, last_index)
    result = @store.pop

    # start heap_down with the root(index 0)
    heap_down(0) unless @store.empty?
    result.value
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
    @store.nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    if index == 0 
      # base case
      return @store
    else
      # recursive step
      parent = (index - 1) / 2

      if @store[parent].key > @store[index].key
        swap(parent,index)
        heap_up(parent)
      else
        return @store
      end
    end
  end


  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_down(index)

    return if index == (@store.length - 1)
    left_child_index = (index * 2) + 1
    right_child_index = (index * 3) + 2

    return if !@store[left_child_index]

    if @store[left_child_index].key < @store[index].key
      if @store[right_child_index] && @store[right_child_index].key < @store[index].key
        min_child = @store[left_child_index].key <= @store[right_child_index].key ? left_child_index : right_child_index
        swap(index, min_child)
        heap_down(min_child)
      else
        swap(index, left_child_index)
        heap_down(left_child_index)
      end
    else
      return
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
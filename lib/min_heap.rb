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
  # Space Complexity: O(log n) - potential stack call when we heap_up
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
    # oh so we're using an array implementation 
    # compare the new node with it's parent 
    # if they are out of order swap and head_up
    # using the parent's index number

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
    # heap_down until you've reached a leaf node?
    # swap smaller to two children if it's a min heap
    # repeat until we stop making swap or reach a leaf node

    # recursive case is when there is at least one child
    left = index * 2 + 1
    right = index * 2 + 2
    # if left child index is less or equal to the length of arr, it's a leaf node
    if @store.length <= index * 2 + 1 # && @store.length - 1 > right_child
      # node doesn't have any children
      return @store
    else # recursive case, we're not at a leaf node, heap_down if we're able to 
      # try left, swap if we're able
      # if we can't, try right,swap if we're able 
      # if we can't swap, return 
      if @store[index].key > @store[left].key
        swap(index, left)
        # not exactly sure why we're passing down the index again?
        heap_down(index)
      elsif @store[index].key > @store[right].key
        swap(index, right)
        heap_down(index)
      else
        return @store
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
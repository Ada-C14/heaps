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

    child_i = index * 2
    # base case, return if we reach bottom of the tree
    return if child_i > @store.length - 1
    # make sure we get the smallest child
    not_the_last_element = child_i < @store.length - 1 
    left_child = @store[child_i]
    right_child = @store[child_i + 1]
    child_i += 1 if not_the_last_element && right_child.key < left_child.key

    # another base case, return if parent is smaller than child
    return if @store[index].key <= @store[child_i].key

    swap(index, child_i)
    heap_down(child_i)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
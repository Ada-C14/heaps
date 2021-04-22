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
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: ?
  def remove()
    return nil if @store.empty?

    swap(0, @store.length - 1)
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
  # Time complexity: ?
  # Space complexity: ?
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

      if @store[index].key < @store[parent].key
        swap(index, parent)
        heap_up(parent)
      end
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # heap_down until you've reached a leaf node?
    # swap smaller to two children if it's a min heap
    # repeat until we stop making swap or reach a leaf node

    # check to see if the node has children 

    # left_child = i * 2 + 1
    # right_child = i * 2 + 2

    # base case is when the node doesn't have any children

    
    # if index * 2 + 2  < @store.length - 1
    #   right_child = index * 2 + 2
    # elsif index * 2 + 1 < @store.length - 1
    #   left_child = index * 2 + 1
    # else
    #   # it doesn't have any child 
    #   return @store
    # end


    # recursive case is when there is at least one child
    left_child = index * 2 + 1
    right_child = index * 2 + 2
    if @store.length - 1 > left_child && @store.length - 1 > right_child
      return @store
    else
      if @store[index].key > @store[left].key
        swap(index, left)
        heap_down(left)
      elsif @store[index].key > @store[right].key
        swap(index, left)
        heap_down(right)
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
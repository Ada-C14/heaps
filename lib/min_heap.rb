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
  # Time Complexity: O(m+1), where m is height  -  O(1) for adding, O(m) for heap up
  # Space Complexity: O(1) -  no new data structures made, but O(m) for heap up call stack (is it the number of calls in the calls stack or number of structures made?)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    
    # @store.each do |node|
    #   puts node.key
    # end

    print @store[0].key
    if @store.length > 1
      heap_up(@store.length - 1)
    end

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
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(m) where m is height
  # Space complexity: O(1), no persistent data structure is made beyond 1 temporary reassigned variable
  def heap_up(index)
    return if index == 0

    if @store[index].key < @store[((index - (index % 3)) / 2)].key 
      temp = @store[index] 
      @store[index] = @store[((index - (index % 3)) / 2)]
      @store[((index - (index % 3)) / 2)] = temp
    end

    heap_up(((index - (index % 3)) / 2))
    
  end



  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    raise NotImplementedError, "Method not implemented yet..."
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
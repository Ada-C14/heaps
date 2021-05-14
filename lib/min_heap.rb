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
    
    if @store.length > 1
      heap_up(@store.length - 1)
    end

  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(n+1)
  # Space Complexity: O(1)
  def remove()
    swap(0, -1)
    popped = @store.pop 
    heap_down(0)
    return popped.value
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
    
    if @store.nil? || @store.length == 0
      return true
    else 
      return false
    end

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
  # left_child = i * 2 + 1 
  # right_child = i * 2 + 2
  def heap_down(index)
    return if @store[index].nil?

    if !@store[index * 2 + 1].nil? && @store[index].key > @store[index * 2 + 1].key
      swap(index, (index * 2 + 1))
    end

    if !@store[index * 2 + 2].nil? && @store[index].key > @store[index * 2 + 2].key
      swap(index, (index * 2 + 2))
    end

    heap_down(index * 2 + 1)
    heap_down(index * 2 + 2)

  end

  # If you want a swap method... you're welcome
  #THANK YOUUUUUU
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
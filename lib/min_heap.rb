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
    height = 0
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    parent_index = @store.length/2 - 1                          #parent = (child_element - 1)/2
    is_left_child = @store[2 * parent_index + 1] == @store[-1]  #left_child = 2 * parent_index + 1
                                                                #right_child = 2 * parent_index + 2
    if !is_left_child && @store[parent_index].key > key
      @store[parent_index], @store[-1] = @store[-1], @store[parent_index]
    end
    return @store
  end
  # def add(key, value = key)
  #   @store << HeapNode.new(key, value)
  #   puts "before: #{@store.map{|pair| pair.key}}"
  #   if @store[-2] && @store[-2].key[0] > key
  #     @store[-2], @store[-1] = @store[-1], @store[-2]
  #   end
  #   puts "after: #{@store.map{|pair| pair.key}}"
  # end

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
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    
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
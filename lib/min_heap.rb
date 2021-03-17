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
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    # always add element to back to bubble up
    @store << HeapNode.new(key, value) 

    heap_up((@store.length - 1))
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    swap(0, @store.length - 1) # swap last element with root, O(n) to calc length
    old_top = @store.pop() # remove former root with O(1) time

    heap_down(0) # bubble down new top element so lowest element in 0 index

    return old_top.value # return old min's value
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
    return @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    # base case: index is 0 
    if index > 0 
      # we need to subtract 1 from index to account for 0-indexing
      parent_i = (index - 1)/2

      # make sure its sibling isn't smaller, else swap them
      # i think technically you can just change which index
      # index is compared to, but the test got mad at me when i tried
      # that and i'm not sure how to avoid that, so i just swapped them 
      # so i wouldn't have to change parent_i
      if @store[parent_i + 1].key < @store[parent_i].key 
        swap(parent_i + 1, parent_i) 
      end

      # check if swap needs to happen
      if  @store[index].key < @store[parent_i].key
        swap(index, parent_i) 
        heap_up(parent_i) # recursive call to keep bubbling up 
      end

      # don't need to recursive call if reaches here; at correct position
    end
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's larger
  #  than it's smallest child node
  def heap_down(index)
    
  end

  # If you want a swap method... you're welcome
  # THANK YOU 
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
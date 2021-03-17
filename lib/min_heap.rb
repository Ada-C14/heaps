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
    return nil if empty? 
    swap(0, @store.length - 1) # swap last element with root, O(n) to calc length
    old_top = @store.pop() # remove former root with O(1) time

    heap_down(0) unless empty?# bubble down new top element so lowest element in 0 index

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
  # Time complexity: O(1) - just check if first element exists
  # Space complexity: O(1) - no new variables created, only checking existing variables or lack thereof
  def empty?
    return @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) worst/avg case as heap_up travels half the distance
  # to the first element every iteration

  # Space complexity: O(log n) worst/avg case other than creating holding variables,
  # recursive call for stack for a node that needs to bubble all the way every time half
  # of distance traveled to first element
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
  # Time complexity: O(log n) worst/avg case as heap_down travels double the distance
  # from the current index for every recursive call
  
  # Space complexity: O(log n) worst/avg case other than creating holding variables,
  # recursive call for stack for a node that needs to bubble all the way every time it 
  # doubles distance traveled across @store
  def heap_down(index)
    # base case 1, can't reach any more child nodes
    # ^ meaning heap node has reached deepest depth of heap
    if 2 * (index + 1) - 1 < @store.length - 1
      child_i = 2 * (index + 1) - 1 # (index + 1) to account for zero index
    
      swap(child_i, child_i + 1) if @store[child_i].key > @store[(child_i + 1)].key

      if @store[child_i].key < @store[index].key
        swap(index, child_i)
        heap_down(child_i) 
      end
    # base case 2, index is not last element
    elsif index < @store.length - 1
      swap(index, index + 1) if @store[index].key > @store[index + 1].key
    end
    # note that add will reorder the heap through swap
  end

  # If you want a swap method... you're welcome
  # THANK YOU 
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
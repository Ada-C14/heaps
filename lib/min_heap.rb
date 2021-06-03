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
  # Space Complexity: O(n)
  def add(key, value = key)
    # raise NotImplementedError, "Method not implemented yet..."
    # add new node into array (@store) <- shovel or push
    # run the heap_up( arr.length - 1 or @store[-1])
    @store.push(HeapNode.new(key, value))
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(n)
  def remove()
    # raise NotImplementedError, "Method not implemented yet..."
    if @store.empty?
      return nil
    end

    swap(0, @store.length - 1)
    result = @store.pop #pop removes the last item in an array

    heap_down(0) unless @store.empty?
    return result.value
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
    # raise NotImplementedError, "Method not implemented yet..."
    return true if @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(n)
  def heap_up(index) #index of array, key/val, look at key
    parent = (index - 1)/2

    while index != 0 && @store[parent].key > @store[index].key
      swap(parent, index)
      index = parent
      parent = (index - 1)/2
    end
  end

  # This helper method takes an index and 
  # moves it down the heap, if it's larger than its children.
  def heap_down(index)
    # raise NotImplementedError, "Method not implemented yet..."
    # return if @store[index].key < r_child && @store[index].key < l_child # index is already set to 0
    r_child = 2 * index + 2
    l_child = 2 * index + 1
    if !(@store[l_child] == nil && @store[r_child] == nil)
      if @store[index].key > @store[l_child].key || (@store[r_child] != nil && @store[index].key > @store[r_child].key)
        if @store[r_child] == nil || @store[l_child].key < @store[r_child].key
          swap(index, l_child)
          heap_down(l_child)
        else
          swap(index, r_child)
          heap_down(r_child)
        end
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



################################################
# IGNORE ME!  (spiraled)

# until ((@store[index].key <=  @store[l_child].key) && (@store[index].key <=  @store[r_child].key) -# while the parent is less than 
  #   if (@store[l_child].key < @store[index].key) && @store[l_child].key < @store[r_child].key
  #     swap(index, l_child)
  #     index = l_child 
  #     l_child.nil?
  #   elsif (@store[r_child].key < @store[index].key) && (@store[r_child].key < @store[l_child].key)
  #     swap(index, r_child)
  #     index = r_child
  #     r_child = 2 * index + 2
  #     r_child.nil?
  #   else
  #     return
  #   end
  # end
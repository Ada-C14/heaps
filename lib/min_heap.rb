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
  # Time Complexity: O(logn), after addded a new value to the end of the array (O(1)), 
  #                           the value will be compared with its parent and be swapped until the heap tree is correct, 
  #                           and the worst case scenario is to perform to the root.
  #                           Therefore, the comparison (heap_up method) is O(logn), and n is the height of the tree.
  #                           So it's O(1) + O(logn) --> O(logn).
  # Space Complexity: O(1), it uses one more space every time when a new value is added.
  def add(key, value = key)
    @store.push(HeapNode.new(key, value))

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn), when deleted a value from the array, it will swap the root value with the value at the end of the array, and removed it (O(1)).
  #                           Then the value at the root will be compared with its child and be swapped until the heap tree is correct, 
  #                           and the worst case scenario is to perform to the leaf.
  #                           Therefore, the comparison (heap_down method) is O(logn), and n is the height of the tree.
  #                           So it's O(1) + O(logn) --> O(logn).
  # Space Complexity: O(1), it removes one space every time when a new value is deleted.
  def remove()
    temp = @store[0].value
    swap(0, @store.length - 1)
    @store.delete_at(@store.length - 1)

    heap_down(0)
    return temp
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
  # Time complexity: O(1), check index 0 to see if heap is empty, so it's O(1).
  # Space complexity: O(1), no extra memory is used, so it's O(1).
  def empty?
    return @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn), the value will be compared with its parent and be swapped until the heap tree is correct, 
  #                           and the worst case scenario is to perform to the root.
  #                           Therefore, it's O(logn), and n is the height of the tree.
  # Space complexity: O(1), it takes a constant amount of variables.
  def heap_up(index)
    parent = (index - 1)/2

    until @store[parent].key < @store[index].key || index == 0 
      swap(parent, index)
      index = parent
      parent = (index - 1)/2
    end
    return @store
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # consider 4 cases when heap_down to the leaf
  # case1: no left leaf (then it definitely has no right leaf)
  # case2: with left leaf but no right leaf, check if the left leaf smaller than parent
  # for case3 & case4, both their left & right leaves exist, we have to compare left and right to see who to swap with
  # case3: left < right and left < parent
  # case4: right < left and right < parent
  def heap_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    # case1
    return @store if @store[left_child].nil?

    # case2
    if @store[right_child].nil? 
      if @store[left_child].key < @store[index].key
        swap(index, left_child)
      end
    # case3 & case 4
    else
      child = (@store[left_child].key < @store[right_child].key ? left_child : right_child)
      if @store[child].key < @store[index].key
        swap(index, child)
        heap_down(child)
      end
    end

    return @store
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
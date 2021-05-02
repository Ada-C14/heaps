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
  # Space Complexity: O(log n) - n is the number of elemnts in the heap
  def add(key, value = key)
    # put the element to the back of the arr
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1) 
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    return nil if @store.empty?
    swap(0, @store.length - 1) # swap the root & last node 
    removed = @store.pop
    heap_down(0) # heap-down
    return removed.value
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
    return @store.length == 0 ? true : false
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    # compare the new node with its parent, if they are out of order swap and heap-up
    # to find the parents: i - 1 /2
    return if index == 0 # base case
    parent = (index - 1) / 2 # find the parent

    if @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # compare root with its children 
    # make a swap with its largest child
    min_child = index #0
    left_child = 2 * index  + 1 # 1
    right_child = 2 * index + 2 # 3

    if left_child < @store.length && @store[left_child].key < @store[min_child].key
      swap(min_child, left_child)
    end

    if right_child < @store.length && @store[right_child].key < @store[min_child].key
      swap(min_child, right_child)
    end
    
    if min_child != index
      swap(index, min_child)
      heap_down(min_child)
    end 
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
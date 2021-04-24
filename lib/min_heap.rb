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
  # Time Complexity: O(logn)
  # Space Complexity: ?
  def add(key, value = key)
    node = HeapNode.new(key, value)
    @store.push(node)
    return heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    return if @store.empty?
    swap(0, -1)
    removed = @store.pop
    heap_down(0) unless @store.empty?
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
    return @store[0].nil?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn)
  # Space complexity: O(logn)
  def heap_up(index)
    return if index == 0

    parent = (index - 1)/2
    if @store[parent].key > @store[index].key
      swap(parent, index)
    else
      return
    end

    return heap_up(parent)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = (index * 2) + 1
    right_child = (index * 2) + 2

    # check for at least left
    if @store[left_child] && !@store[right_child]
      if @store[index].key > @store[left_child].key
        swap(index, left_child)
      end
    end
    
    # checking for both
    return unless @store[right_child] && @store[left_child]

    if @store[index].key > @store[left_child].key || @store[index].key > @store[right_child].key
      smallest = @store[right_child].key < @store[left_child].key ? right_child : left_child
      swap(index, smallest)
    else
      return
    end

    return heap_down(index)

  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end

# heap = MinHeap.new
# p heap.add(3, "Pasta")
# p heap.add(6, "Soup")
# p heap.add(1, "Pizza")
# heap.add(0, "Donuts")
# heap.add(16, "Cookies")
# heap.add(57, "Cake")
# heap.remove
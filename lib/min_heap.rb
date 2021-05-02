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
  # Time Complexity: O(log n) where n is the number of nodes in the heap
  # Space Complexity: O(2) == O(1)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
    return @store
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n) where n is the number of nodes in the heap
  # Space Complexity: O(2) == O(1)
  def remove()
    return nil if empty?
    @store[0], @store[-1] = @store[-1], @store[0]
    removed_node = @store.pop
    heap_down(0)
    return removed_node.value
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
  # Time complexity: O(1) ? I think the length of arrays is somehow cached or something in Ruby? If not, then O(n) where n is the number of elements in the array
  # Space complexity: O(1)
  def empty?
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than its parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) where n is the number of nodes in the heap
  # Space complexity: O(1)
  def heap_up(current)
    parent = (current - 1) / 2
    while @store[current].key < @store[parent].key do
      @store[parent], @store[current] = @store[current], @store[parent]
      current = parent
      parent = current / 2
    end
  end

  # This helper method takes an index and
  #  moves it down the heap if it's larger
  #  than its child nodes.
  def heap_down(current)
    current = 0
    left_child = current * 2 + 1
    right_child = current * 2 + 2
    child = @store[left_child].key < @store[right_child].key ? left_child : right_child

    while @store[current].key > @store[child].key do
      @store[child], @store[current] = @store[current], @store[child]

      current = child
      left_child = current * 2 + 1
      right_child = current * 2 + 2
      if @store[left_child] && @store[right_child]
        child = @store[left_child].key < @store[right_child].key ? left_child : right_child
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

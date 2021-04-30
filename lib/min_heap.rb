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
  # Time Complexity: O(log n): push O(1) + heap_up O(log n)
  # Space Complexity: O(log n) : heap_up O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n): pop, swap O(1) + heap_down O(log n)
  # Space Complexity: O(log n) from heap_down call stacks
  def remove()
    return nil if @store.empty?

    swap(0, @store.length - 1)
    removed_element = @store.pop
    heap_down(0) unless @store.empty?

    return removed_element.value
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
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n): swap - O(1), and we will do it up to O(log n) times
  # Space complexity: O(log n) for call stacks
  # min heap, the smallest node goes up to root
  def heap_up(index)
    parent_index = (index - 1) / 2
    #base cases - stop when in order(parent < child) or reach root
    return @store if @store[index].key > @store[parent_index].key || index == 0

    swap(index, parent_index)
    heap_up(parent_index)
     
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  # swap parent with the smaller child
  # Time complexity: O(log n): find_smaller_childs_index - O(1), swap - O(1), and we will do it up to O(log n) times
  # Space complexity: O(log n) for call stacks
  def heap_down(index)
    left_child = index * 2 + 1
    right_child = index * 2 + 2
    smaller_child = find_smaller_childs_index(left_child, right_child)
    #base cases - node has no child or in order(parent < child) 
    return @store if @store[smaller_child].nil? || @store[index].key < @store[smaller_child].key 

    swap(index, smaller_child)
    heap_down(smaller_child)

  end

  def find_smaller_childs_index(left_index, right_index)
    if @store[right_index]
      return @store[left_index].key > @store[right_index].key ? right_index : left_index
    else
      return left_index
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
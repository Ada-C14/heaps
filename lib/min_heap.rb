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
  # Time Complexity: o(log n)
  # Space Complexity: o(n)
  def add(key, value = key)

  new_node = HeapNode.new(key, value)
  @store.push(new_node)

  heap_up(@store.length - 1)

  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: o(log n)
  # Space Complexity: o(log n)
  def remove()

    return if @store.empty?
  
    swap(0, @store.length - 1)
    removed_result = @store.pop
    heap_down(0) unless @store.empty?
    return removed_result.value
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
  # Time complexity: o(1)
  # Space complexity: o(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: o(log n)
  # Space complexity: o(log n)
  def heap_up(index)
    return if index == 0

    parent = (index - 1) / 2
    if @store[parent].key > @store[index].key
      swap(parent, index)
      heap_up(parent)
    else
      return
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
      left_index = index * 2 + 1
      right_index = index * 2 + 2
      return if left_index >= @store.length
      child = nil
      left = @store[left_index]
      right = @store[right_index]
      if left && right
        child = left.key < right.key ? left_index : right_index
        if @store[child].key < @store[index].key
          swap(index, child)
          index = child
        else
          return
        end
      elsif left && !right
        return unless left.key < @store[index].key
        child = left_index
        swap(index, child)
        index = child
      else
        return
      end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
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
  # Time Complexity: O(log n) to swap for each level
  # Space Complexity: O(log n) for the call stack in heap_up??
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
 	# Time Complexity: O(log n) to swap for each level
  # Space Complexity: O(log n) for the call stack in heap_down??
  def remove()
    return nil if @store.empty?

		swap(0, @store.length - 1)
		result = @store.pop

		# resort min-heap
		heap_down(0)

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
    return @store.length == 0
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time Complexity: O(log n) to swap for each level
  # Space complexity: O(log n) for the call stack
  def heap_up(index)
    return if index == 0

    parent_index = (index - 1) / 2

    if @store[index].key < @store[parent_index].key
			swap(index, parent_index)
			# re-sort min-heap
			heap_up(parent_index)
		end
  end

  # This helper method takes an index and 
  #  moves it down the heap if it's larger
  #  than it's children node.
  def heap_down(index)
		return if is_a_leaf(index)

		smallest_child_index = min_child_index(index)

		if @store[index].key > @store[smallest_child_index].key
			swap(index, smallest_child_index)
			# resort min-heap
			heap_down(smallest_child_index)
		end
  end

	# Helper method returns true if the given index is on the last level / is a leaf
	def is_a_leaf(index)
		left_child_index = (index * 2 ) + 1 
		last_index = @store.length - 1

		return left_child_index > last_index
	end

	# Helper method returns the index of the smallest child
	def min_child_index(index)
		left_child_index = (index * 2) + 1
		right_child_index = (index * 2) + 2

		left_child_is_last_leaf = (left_child_index == @store.length - 1)

		if ( left_child_is_last_leaf ) || 
			( @store[left_child_index].key < @store[right_child_index].key ) 
			return left_child_index
		else 
			return right_child_index
		end
	end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
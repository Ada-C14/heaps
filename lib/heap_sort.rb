

# # This method uses a heap to sort an array.
#  # Time Complexity: O(n log n) to add elements to a heap and swap them in order at each level
#  # Space Complexity: O(log n) for recursive heap_up in .add
def heapsort(list)
	return [] if list.empty?

  min_heap = MinHeap.new()

  list.each do |item|
		min_heap.add(item)
	end

	sorted_array = []

	list.length.times do
		sorted_item = min_heap.remove()
		sorted_array << sorted_item
	end

	return sorted_array
end

def swap(list, index_1, index_2)
	temp = list[index_1]
	list[index_1] = list[index_2]
	list[index_2] = temp
end



# Challenge If you can, do this method in O(1) space complexity.
# This method uses a heap to sort an array.
# Time Complexity: O(n log n) to add elements to a heap and swap them in order at each level
# Space Complexity: O(1)
def heapsort_in_place(list)
	return [] if list.empty?

	# Build heap (rearrange array)
	build_min_heap(list)

	unsorted_last_index = list.length - 1

	while unsorted_last_index > 0
		# Move current root (largest) to end
		swap(list, 0, unsorted_last_index)

		# Max heapify the reduced heap
		max_heapify(list, unsorted_last_index, 0)

		# The end is sorted
		unsorted_last_index -= 1
	end

	return list
end


def build_min_heap(list)
	# range of internal nodes is 0 to (n/2 - 1) and range of leaves is (n/2) to (n - 1)
	i = list.length / 2 - 1

	while i >= 0 do
		max_heapify(list, list.length, i)
		i -= 1
	end

	return list
end


def max_heapify(list, size, root)
	root_larger_than_children = false

	while !root_larger_than_children
		largest = root

		left_child_index = (root * 2) + 1
		right_child_index = (root * 2) + 2

		left_child_exists = (left_child_index <= (size - 1))
		right_child_exists = (right_child_index <= (size - 1))

		# If left child is larger than root
		if left_child_exists && list[left_child_index] > list[largest]
			largest = left_child_index
		end

		# If right child is larger than largest so far
		if right_child_exists && list[right_child_index] > list[largest]
			largest = right_child_index
		end

		# If largest is not root, swap
		if largest != root
			swap(list, largest, root)

			root = largest
			next
		end

		root_larger_than_children = true
	end
end
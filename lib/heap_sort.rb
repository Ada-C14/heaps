

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heapsort(list)
  heapsorted_array = []
  return heapsorted_array if list.empty?
  
  heap = MinHeap.new()
  
  list.each do |item|
    heap.add(item)
  end

	list.length.times do
		removed = heap.remove()
		heapsorted_array << removed
	end

	return heapsorted_array

  
end
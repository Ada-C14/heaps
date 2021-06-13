

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  heap = MinHeap.new

  list.each do |i|
    heap.add(i)
  end

  sorted_array = []
  
  until heap.empty?
    sorted_array << heap.remove
  end
    return sorted_array
end


# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  if list.empty?
    return []
  end

  heap = MinHeap.new

  list.each do |val|
    heap.add(val)
  end

  sorted = []

  until heap.empty?
    sorted << heap.remove
  end


  return sorted
end
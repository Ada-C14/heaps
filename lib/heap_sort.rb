

# This method uses a heap to sort an array.
# Time Complexity:  O(n * log n) // each loop is O(n log n)
# Space Complexity: O(n) -  where n is the length of the input
def heapsort(list)
  
  heap = MinHeap.new

  list.each do |element|
    heap.add(element)
  end

  sorted = []
  until heap.empty?
    sorted << heap.remove
  end

  return sorted

end
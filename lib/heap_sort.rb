

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heapsort(list)
  
  # swap first with the last
  return list if list.empty?
  heap = MinHeap.new  # create a min heap

  list.each do |element|
    heap.add(element)
  end

  sorted = []
  i = 0
  while i < list.length
    sorted << heap.remove
    i += 1
  end
  sorted
end
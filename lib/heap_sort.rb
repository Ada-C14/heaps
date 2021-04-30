

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn): add O(nlogn) + remove O(nlogn)
# Space Complexity: O(n) for creating @store to store all the nodes
def heapsort(list)
  min_heap = MinHeap.new

  list.each do |element|
    min_heap.add(element)
  end

  list.map! do |element|
    min_heap.remove
  end

  return list
end
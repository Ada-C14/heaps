

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n); adding n nodes to a heap is O(n log n), 
# while removing n nodes from the heap is O(n log n) => O(nlog n + nlog n)
# Space Complexity: O(n) because of heap with up to n nodes
def heapsort(list)
  min_heap = MinHeap.new
  list.each { |key| min_heap.add(key) }
  list.length.times { |i| list[i] = min_heap.remove }
  return list
end
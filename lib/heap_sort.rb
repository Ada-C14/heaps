require_relative "../lib/min_heap"

# This method uses a heap to sort an array.
# Time Complexity: O(nlog(n)) - adding and removing elements from a heap are nlog(n) operations
# Space Complexity: O(n) - although it is simple to manipulate to be O(1)
def heapsort(list)
  heap = MinHeap.new
  list.each do |item|
    heap.add(item)
  end

  result = []
  until heap.empty?
    result.push(heap.remove)
  end

  return result
end
require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heapsort(list)
  result = []
  heap = MinHeap.new
  list.each do |element|
    heap.add(element)
  end

  until heap.empty?
    result << heap.remove
  end

  return result
end
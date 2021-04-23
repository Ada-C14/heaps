require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n) where n is number of nodes; add O(log n) + remove O(log n) = O(n log n)
# Space Complexity: O(n), creates heap of n elements ... I don't know how to do this in O(1) :(
def heapsort(list)
  return list if list.empty? || list.length < 2

  min_heap = MinHeap.new
  list.each do |value|
    min_heap.add(value)
  end

  i = 0

  while i < list.length
    list[i] = min_heap.remove
    i += 1
  end

  return list
end
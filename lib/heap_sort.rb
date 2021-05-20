

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heapsort(list)
  heap = MinHeap.new
  result = []

  list.each {|element| heap.add(element)}

  until heap.empty?
    result << heap.remove
  end

  return result
end
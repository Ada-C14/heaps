

# This method uses a heap to sort an array.
# Time Complexity:  O(n)
# Space Complexity: O(n)
def heapsort(list)
  return list if list.length <= 1

  min_heap = MinHeap.new

  list.each { |element| min_heap.add(element) }
  
  list.map! { min_heap.remove }

  return list
end

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heapsort(list)
  return list if list.length <= 1 

  heap = MinHeap.new

  list.each do |num|
    heap.add(num)
  end

  # removing root of the heap one by one until there are no more elements in the heap 
  i = 0
  until i == list.length 
    list[i] = heap.remove 
    i += 1
  end
  return list
end

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn)
# Space Complexity: O(n)
def heapsort(list)
  return list if list.empty?
  heap = MinHeap.new

  list.each do |n|
    heap.add(n)
  end

  list.length.times do |i|
    list[i] = heap.remove
  end

  return list
end

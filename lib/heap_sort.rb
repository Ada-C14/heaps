

# This method uses a heap to sort an array.
# Time Complexity:  n log(n)
# Space Complexity: n
def heap_sort(list)
  heap = MinHeap.new

  list.each do |element|
    heap.add(element)
  end

  sorted_list = []
  until heap.empty?
    sorted_list.push(heap.remove)
  end

  return sorted_list
end
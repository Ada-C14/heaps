

# This method uses a heap to sort an array.
# Time Complexity:  O(nlog(n))
# Space Complexity: O(n)
def heapsort(list)
  # raise NotImplementedError, "Method not implemented yet..."

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
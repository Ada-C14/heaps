

# This method uses a heap to sort an array.
# Time Complexity:  O(m+n) 
# Space Complexity: O(n) - will have a call stack equal to number of nodes, though we are make a constant number of data structures... maybe O(1)
def heap_sort(list)
  # raise NotImplementedError, "Method not implemented yet..."
  # left_child = i * 2 + 1 
  # right_child = i * 2 + 2
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
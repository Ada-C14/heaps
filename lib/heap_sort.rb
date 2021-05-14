

# This method uses a heap to sort an array.
# Time Complexity:  O(n) - will go to every node to compare and heap up
# Space Complexity: O(n) - will have a call stack equal to number of nodes, though we are not makng a new data structure.
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
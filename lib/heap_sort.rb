
require_relative "./min_heap.rb"

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  heap = MinHeap.new

  list.each do |int|
    heap.add(int)
  end

  i = 0 
  
  until i == list.length
    list[i] = heap.remove
    i += 1
  end

  return list;
end
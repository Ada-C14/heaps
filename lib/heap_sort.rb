require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heapsort(list)
  return [] if list.empty?
  heap = MinHeap.new

  list.each do |val|
    heap.add(val)
  end

  sorted_list = []

  i = 0 
  until i == list.length
    sorted_list << heap.remove
    i += 1
  end

  sorted_list
end
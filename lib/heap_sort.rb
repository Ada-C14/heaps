
require_relative "min_heap"
# This method uses a heap to sort an array.
# Time Complexity:  o(nlogn)
# Space Complexity: o(nlogn)
def heap_sort(list)
  #add elements to a heap
  #remove elements from heap one-by one, placing them in order
  sort_heap = MinHeap.new
  sorted = []
  list.each{|element| sort_heap.add(element)}
  list.length.times{|i| sorted.push(sort_heap.remove)}
  return sorted
end
require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n) where n is the number of elements in the given array
# Space Complexity: O(n)
def heap_sort(list)
  heap = []
  list.each_with_index do |element, current|
    heap << element
    parent = current / 2
    while heap[current] < heap[parent] do
      heap[parent], heap[current] = heap[current], heap[parent]
      current = parent
      parent = current / 2
    end
  end
  return heap
end
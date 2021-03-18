
require_relative "./min_heap.rb"

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n) - for n elements, each element requires O(log n) worst case to insert into 
# heap -- remaining operations are O(n) and at a lower degree, highest degree of complexity is 
# therefore n * log n => O(n log n)

# Space Complexity: O(n) to store n nodes, one node per element, in
# newly created heap. From the heap, the input list was overwritten
# to conserve an extra degree of space, though I don't think this 
# actually changes the space complexity big O... 
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
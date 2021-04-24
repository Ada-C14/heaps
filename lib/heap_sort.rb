require_relative 'min_heap'

# This method uses a heap to sort an array.
# Time Complexity: O(nlogn), step 1 takes n * logn and step 2 is also n * logn.
#                            So it's O(nlogn) * 2 --> O(nlogn).
# Space Complexity: O(n), step 1's min_heap takes O(n) and step 2's sorted_array takes O(n) as well.
#                         So it's O(n) * 2 --> O(n). 
def heapsort(list)
  # step 1: create a min heap
  min_heap = MinHeap.new
  list_length = list.length
  index = 0
  while index < list_length 
    min_heap.add(list[index])
    index += 1
  end

  # step 2: turn min heap to sorted array
  sorted_array = []
  while list_length > 0
    sorted_array.push(min_heap.remove)
    list_length -= 1
  end 
  return sorted_array
end
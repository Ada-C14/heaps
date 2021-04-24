require_relative 'min_heap'

### Sort in-place, need to use Max heap to avoid min heap's bubble down issue
# Time Complexity: O(nlogn), step 1 takes n * logn (heap_up) and step 2 is also n * logn (heap_down).
#                            So it's O(nlogn) * 2 --> O(nlogn).
# Space Complexity: O(1), step 1 & 2 sort the array in-place and the extra variables used here are a constant.
def heapsort(list)
  # step 1: sort the list to min heap in place
  list_length = list.length
  index = 0
  while index < list_length 
    heap_up(index, list)
    index += 1
  end
  
  # step 2: turn min heap to sorted array
  while list_length > 0
    swap(0, list_length-1, list)
    list_length -= 1
    heap_down(0, list, list_length)
  end

  return list
end

# helper methods: heap_up & heap_down & swap
def heap_up(index, list)
  parent = (index - 1)/2

  until list[parent] > list[index] || index == 0 
    swap(parent, index, list)
    index = parent
    parent = (index - 1)/2
  end
end

def heap_down(index, list, last)
  left_child = 2 * index + 1
  right_child = 2 * index + 2
  while list[left_child] && list[right_child] && right_child < last
    child = (list[left_child] > list[right_child] ? left_child : right_child)
    if list[child] > list[index]
      swap(index, child, list)
      heap_down(child, list, last)
    else
      break
    end
  end

  # only check left_child because list[right_child] won't be nil for in-place replacement
  if left_child < last
    if list[left_child] > list[index]
      swap(index, left_child, list)
    end
  end
end

def swap(index_1, index_2, list)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end


# This method uses a heap to sort an array.
# Time Complexity: O(nlogn), step 1 takes n * logn and step 2 is also n * logn.
#                            So it's O(nlogn) * 2 --> O(nlogn).
# Space Complexity: O(n), step 1's min_heap takes O(n) and step 2's sorted_array takes O(n) as well.
#                         So it's O(n) * 2 --> O(n). 
def heap_sort(list)
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
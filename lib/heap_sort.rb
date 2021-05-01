require_relative 'min_heap'

def swap(index1, index2, list)
  list[index1], list[index2] = list[index2], list[index1]
end

# for max heap
# this is helpful https://www.youtube.com/watch?v=2DmK_H7IdTo
def heap_down(start_index, end_index, list)
  left_child = (start_index * 2) + 1
  right_child = (start_index * 2) + 2

  p start_index
  p left_child
  p right_child

  return if left_child > end_index || right_child > end_index

  # check for at least left
  if list[left_child] && !list[right_child]
    if list[start_index] < list[left_child]
      swap(start_index, left_child, list)
    end
  end
  
  # checking for both
  return unless list[right_child] && list[left_child]

  if list[start_index] < list[left_child] || list[start_index] < list[right_child]
    largest = list[right_child] > list[left_child] ? right_child : left_child
    swap(start_index, largest, list)
  else
    return
  end

  p "list in recursion: #{list}"

  return heap_down(start_index + 1, end_index, list)

end

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  # heap = MinHeap.new()

  # until list.empty?             # time: o(n)
  #   heap.add(list.pop)          # time: o(logn) heap add, o(1) list.pop, space: o(n)
  # end

  # until heap.empty?             # time: ?
  #   list.push(heap.remove)      # time: o(logn) heap remove, o(1) list.push, space: o(n)
  # end

  # return list

  # turn array in max heap - bunch of heap downs
  # swap 1st and last
  # turn array[0..last element -  1] into max heap
  # swap 1st and last
  # continue 

  i = 0
  j = list.length - 1
  while i < list.length - 1
    heap_down(0, j, list)
    p "heap down result: #{list}"
    swap(0, j, list)
    j -= 1
    i += 1
    # while j < length - i - 1
    # end
    p list
  end

  return list
end

p heapsort([-50, 3, 5, 16, 27])
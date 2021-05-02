require_relative 'min_heap'

def swap(index1, index2, list)
  list[index1], list[index2] = list[index2], list[index1]
end

# for max heap
# this is helpful https://www.youtube.com/watch?v=2DmK_H7IdTo
# this is also helpful: https://www.programiz.com/dsa/heap-sort
# time: o(logn)
# space: o(logn) - because of call stack?
def heap_down(list, i, length)
  left_child = (i * 2) + 1
  right_child = (i * 2) + 2
  max = i

  if left_child < length && list[left_child] > list[max]
    max = left_child
  end

  if right_child < length && list[right_child] > list[max]
    max = right_child
  end

  if i != max
    swap(i, max, list)
    heap_down(list, max, length)
  end
  
end


# This method uses a heap to sort an array.
# Time Complexity: o(nlogn)
# Space Complexity: o(logn) - bc of call stack?
def heapsort(list)
  # heap = MinHeap.new()

  # until list.empty?             # time: o(n)
  #   heap.add(list.pop)          # time: o(logn) heap add, o(1) list.pop, space: o(n)
  # end

  # until heap.empty?             # time: ?
  #   list.push(heap.remove)      # time: o(logn) heap remove, o(1) list.push, space: o(n)
  # end

  # return list

  end_index = list.length - 1
  while end_index >= 0                                              # time: o(n)
    # heapify - build a max heap
    # parent nodes start at length / 2
    parent_index = end_index/2
    while parent_index >= 0
      heap_down(list, parent_index, end_index)                      # time: o(logn)
      parent_index -= 1 
    end

    # move largest element to the end
    swap(0, end_index, list)

    # don't include sorted portion in further heap down
    end_index -= 1
  end

  return list
end

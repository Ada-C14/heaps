# This method uses a heap to sort an array.
# Time Complexity: O(nlogn)
# >> creating max heap is O(nlogn)
# >> removing from heap is done n times, each time is O(log n) --> O(nlogn)
#
# Space Complexity: O(1)
# >> sorting in-place

def heap_sort(list)
  return list if list.empty?

  # Arrange input list into a max heap
  current_ind = end_ind = list.size - 1
  until end_ind == 0
    until current_ind < 0
      max_heapify(current_ind, end_ind, list)
      current_ind -= 1
    end

    # Swap max element with last element
    swap(0, end_ind, list)

    # Update end index so that we don't resort the item in correct place
    # Update current_ind to start at the end again
    end_ind -= 1
    current_ind = end_ind
  end

  return list
end

def max_heapify(current_ind, end_ind, list)
  max_ind = current_ind
  left_child_ind = current_ind * 2 + 1
  right_child_ind = current_ind * 2 + 2

  max_ind = left_child_ind if left_child_ind < end_ind && list[left_child_ind] > list[max_ind]

  max_ind = right_child_ind if right_child_ind < end_ind && list[right_child_ind] > list[max_ind]

  if max_ind != current_ind
    swap(max_ind, current_ind, list)
    max_heapify(max_ind, end_ind, list)
  end
  
  return
end

def swap(ind1, ind2, list)
  list[ind1], list[ind2] = list[ind2], list[ind1]
  
  return
end

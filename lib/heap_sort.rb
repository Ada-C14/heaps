

# This method uses a heap to sort an array.
# Time Complexity:  O(n * log(n)) where n is the number of elements. 
# Space Complexity: O(log(n)) worsecase because of recursion inside of heapify? 
# list = [5, 27, 3, 16, -50]
def heapsort(list)
  return list if list.empty? || list.length == 1

  # i = the parent of the last element 
  i = (list.size - 1) / 2
  # initial heapify of list 
  while i >= 0
    heapify(list, i, list.length)
    i -= 1
  end

  # list = [-50, 5, 3, 16, 27 ]
  i = 0
  j = list.length - 1
  while j >= 0
    swap(i, j, list)
    j -= 1
    heapify(list, 0, j)
  end

return list
end

def swap(index1, index2, list)
  temp = list[index1]
  list[index1] = list[index2]
  list[index2] = temp
end

def heapify(list, index, size)
    # index here will be the "root" node
    largest = index
    left = 2 * index + 1
    right = 2 * index + 2

    # check if left child is greater than parent
    if left < size && list[left] > list[largest]
      largest = left
    end

    # also check if right child is greater than parent
    if right < size && list[right] > list[largest]
      largest = right
    end

    # if the largest no longer equals it's original value
    if largest != index
      # swap the root and the found largest value
      swap(largest, index, list)
      # make sure the order is still maintained for the children of that new index
      heapify(list, largest, size)
    end
end
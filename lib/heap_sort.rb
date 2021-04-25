
# This method uses a heap to sort an array.
# Time Complexity:  O(nlog n)
# Space Complexity: O(n)
def heap_sort(list)
  return list if list.empty?
  i = list.size / 2
  while i >= 0 do
    heap_down(list, i, list.length - 1)
    i -= 1
  end
  last = list.length - 1
  while last > 0 do
    list[0], list[last] = list[last], list[0]
    last -= 1
    heap_down(list, 0, last)
  end
  return list
end

def heap_down(list, index, size)
  left = 2 * index + 1
  right = 2 * (index + 1)
  largest = index

  largest = left if left <= size && list[left] > list[largest]
  largest = right if right <= size && list[right] > list[largest]
  
  if largest != index
    list[largest], list[index] = list[index], list[largest]
    heap_down(list, largest, size)
  end
end


# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  n = list.length
  a = [nil] + list

  (n/2).downto(1) do |i|
    heapify(a, i, n)
  end

  while n > 1
    a[1], a[n] = a[n], a[1]
    n -= 1
    heapify(a, 1, n)
  end
  a.drop(1)
end

def heapify(list, parent, limit)
  root = list[parent]
  while (child=2 * parent) <= limit
    child += 1 if child < limit && list[child] < list[child+1]
    break if root >= list[child]
    list[parent], parent = list[child], child
  end
  list[parent] = root
end
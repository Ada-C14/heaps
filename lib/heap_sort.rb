

# This method uses a heap to sort an array.
# Time Complexity:  O(n)
# Space Complexity: O(n)
def heapsort(list)
  # raise NotImplementedError, "Method not implemented yet..."
  mamasHeap = MinHeap.new()
  list.each do |e|
    mamasHeap.add(e)
  end
  # p mamasHeap
  new_list = []
  while !mamasHeap.empty?
    new_list << mamasHeap.remove()
  end
  return new_list
end
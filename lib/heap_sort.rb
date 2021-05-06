
# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return list if list.empty?
  heap = MinHeap.new

  list.each do |n|
    heap.add(n)
  end
  return heap.store.map {|node| node.key}
end

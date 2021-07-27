require_relative "./min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  o(log n)
# Space Complexity: o(n)
def heap_sort(list)
    heap = MinHeap.new

    list.each do |item|
        heap.add(item)
    end

    sorted_list = []
    until heap.empty?
        sorted_list << heap.remove
    end

    return sorted_list
end
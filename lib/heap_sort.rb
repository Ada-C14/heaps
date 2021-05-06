

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heap_sort(list)
  # raise NotImplementedError, "Method not implemented yet..."
  # left_child = i * 2 + 1 
  # right_child = i * 2 + 2
  

  return heap_sort_helper(list, 0)
  
end


def heap_sort_helper(list, i)
  return if list[i].nil?
  
  heap_sort_helper(list, (i*2 + 1))
  heap_sort_helper(list, (i*2 + 2))


  if !list[(i*2 +1)].nil? && (list[i].key > list[(i*2 +1)].key)
      temp = list[i] 
      list[i] = list[(i*2 +1)]
      list[(i*2 +1)] = temp
  end
  
  if !list[(i*2 +2)].nil? && list[i].key > list[(i*2 + 2)].key
    temp = list[i] 
    list[i] = list[(i*2 + 2)]
    list[(i*2 + 2)] = temp
end

end 


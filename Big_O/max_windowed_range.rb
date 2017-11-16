def naive(array, window)
  diff = array[window - 1] - array[0]
  array.each_cons(window) do |win|
    current_range = win[-1] - win[0]
    diff = current_range if current_range > diff
  end

  diff
end

#time complexity O(n)



puts naive([1, 3, 2, 5, 4, 8], 5)

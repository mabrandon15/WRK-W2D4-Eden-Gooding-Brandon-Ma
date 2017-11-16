def bad_two_sum?(arr, target)
  arr.each_with_index do |el1, i1|
    arr.each_with_index do |el2, i2|
      next if i1 == i2
      return true if el1 + el2 == target
    end
  end
  false
end

#time complexity O(n^2)

def okay_two_sum?(arr, target)
  arr.sort!

  arr.each_with_index do |el, idx|
    idx2 = binary_search(arr, target - el)

    next if idx2 == nil || idx2 == idx

    if idx2
      return true
    end
  end

  false
end

def binary_search(array, target)
  return nil if array.length == 0

  mid_idx = array.length / 2

  return mid_idx if array[mid_idx] == target

  left = array[0...mid_idx]
  right = array[mid_idx + 1..-1]

  l = binary_search(left, target)
  r = binary_search(right, target)

  if l
    l
  elsif r
    mid_idx + 1 + r
  else
    nil
  end
end

#time complexity nlog(n) + n (log(n)) => O(nlog(n))

def best_two_sum?(array, target)
  hash = Hash.new(-1)
  array.each_with_index do |el, idx|
    hash[el] = idx
  end
  array.each_with_index do |el, idx|
    if hash[target - el] > -1 && hash[target - el] != hash[el]
      return true
    end
  end
  false
end

#time complexity 2n => O(n)

arr = [0, 1, 5, 7]
puts best_two_sum?(arr, 6)

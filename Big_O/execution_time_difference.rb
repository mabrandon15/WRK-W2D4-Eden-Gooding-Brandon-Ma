def my_min1(list)
  result = 0
  list.each do |el1|
    list.each do |el2|
      result = el1 if el1 < el2 && el1 < result
    end
  end
  result

end

#time complexity my_min1 O(n^2) when n = length of array

def my_min2(list)
  result = list.first
  list.each do |el|
    result = el if el < result
  end
  result

end

#time complexity my_min2 O(n) when n = length of array

def largest_contiguous_subsum1(list)
  sums = []

  list.each_with_index do |el1, i1|
    list.each_with_index do |el2, i2|
      if i1 == i2
        sums << el1
      else
        sums << el1 + el2
      end
    end
  end

  result = sums.first

  sums.each do |sum|
    result = sum if sum > result
  end

  result
end

# time complexity largest_contiguous_subsum1 n^2 + n^2 => O(n^2) when n = length of input array

def largest_contiguous_subsum2(list)
  result = list.first
  sum = list.first

  list.each_with_index do |n, i|
    next if i == 0

    sum = 0 if sum < 0

    sum += n

    result = sum if sum > result
  end

  result
end
list = [-3,-7,-8,-2,-3,-4,-8]
puts largest_contiguous_subsum2(list)

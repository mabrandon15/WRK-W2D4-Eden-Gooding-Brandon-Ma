# str = "hello"
#
# arr = str.split("")
#
#
#
# perms = arr.permutation.to_a
#
# perms.map! {|el| el.join("")}
#
# print perms

def first_anagram?(str1, str2)
  arr = str1.split("")
  perms = arr.permutation.to_a
  perms.map! {|el| el.join("")}

  return true if perms.include?(str2)
  false
end



#time complexity n! + 2n => O(n!)

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  duped = arr1.dup
  arr1.each do |el|
    if arr2.include?(el)
      arr2.delete(el)
      duped.delete(el)
      # puts duped.to_s
      # puts arr2.to_s
    end
  end

  return true if duped.empty? && arr2.empty?
  false
end

#time complexity n => O(n)

def third_anagram?(str1, str2)
  arr1 = str1.chars.sort
  arr2 = str2.chars.sort

  if arr1 == arr2
    true
  else
    false
  end
end

#time complexity 2(n*log(n)) + 2n => O(n*log(n))

def fourth_anagram?(str1, str2)
  hsh1 = Hash.new(0)
  hsh2 = Hash.new(0)

  str1.each_char do |c|
    hsh1[c] += 1
  end

  str2.each_char do |c|
    hsh2[c] += 1
  end

  hsh1.values == hsh2.values
end

#time complexity 2n + 2n => O(n)

def bonus_anagram?(str1, str2)
  hsh = Hash.new(0)

  str1.each_char do |c|
    hsh[c] += 1
  end

  str2.each_char do |c|
    hsh[c] -= 1
  end

  hsh.values.all? {|c| c == 0}
end

#time complexity 2n + n => O(n)


puts second_anagram?("gizmo", "gzzmo")
puts second_anagram?("elvis", "lives")

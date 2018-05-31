def sluggish_octopus(arr)
  largest = arr.first

  arr[1..-1].each_with_index do |el,idx|
    arr[1..-1].each_with_index do |el2,idx2|
      largest = el2 if (el2.size > el.size) && (idx != idx2 && el2.size > largest.size)
    end
  end
  largest
end

def dominant_octopus(arr)
  return arr if arr.size < 2

  mid = arr.size / 2
  piv = arr.delete_at(mid)
  lft = arr.select {|el| el.size if el.size < piv.size}
  rit = arr.select {|el| el.size if el.size >= piv.size}

  sorted = dominant_octopus(lft) + [piv] + dominant_octopus(rit)
  sorted.last
end

def clever_octopus(arr)
  biggest = arr.last

  arr[0...-1].each do |el|
    biggest = el if el.size > biggest.size
  end

  biggest
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |el,idx|
    return idx if el == direction
  end

end

def constant_dance(direction, tiles_array)
  hash1 = {}
  tiles_array.each_with_index {|el,idx| hash1[el]=idx}
  p hash1[direction]
end


# # ["right-down"]
# a = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p dominant_octopus(a)
# # p clever_octopus(a)
# # p slow_dance("right-down",tiles_array)

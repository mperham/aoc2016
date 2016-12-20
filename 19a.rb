$size = 3018458
$circle = Array.new($size, 1)

def take(curr)
  idx = (curr + 1) % $size
  while idx != curr
    if $circle[idx] > 0
      $circle[curr] += $circle[idx]
      $circle[idx] = 0
      idx = (idx + 1) % $size
      #if idx > curr
        #puts "aSkipping #{idx - curr} slots"
      #else
        #puts "bSkipping #{(idx+$size) - curr} slots"
      #end
      break
    else
      idx = (idx + 1) % $size
    end
  end
  idx
end

def next_elf(idx)
  count = idx
  loop do
    if $circle[count] > 0
      return count
    else
      count = (count + 1) % $size
    end
  end
end

count = 0
loop do
  idx = take(count)
  break if idx == count
  count = next_elf(idx)
end

puts "elf #{count + 1} has #{$circle[count]} presents"

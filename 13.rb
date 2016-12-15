FAV = 1358
BITS = [ 0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4 ]

def bits(num)
  cnt = 0
  while num > 15
    cnt += BITS[num & 0xF]
    num = num >> 4
  end
  cnt += BITS[num & 0xF]
  cnt
end

def wall?(x, y)
  bits((x*x) + (3*x) + (2*x*y) + y + (y*y) + FAV) % 2 == 1
end

require 'set'

$smallest = 100

def result(steps)
  if steps.size < $smallest
    $smallest = steps.size
    p [$smallest-1, steps]
  end
end

def move(x, y, steps)
  return if x < 0 || y < 0
  return if steps.include?([x, y])
  return if steps.size > 100

  steps << [x,y]

  return result(steps) if x == 31 && y == 39

  move(x-1, y, steps.dup) unless wall?(x-1, y)
  move(x, y-1, steps.dup) unless wall?(x, y-1)
  move(x+1, y, steps.dup) unless wall?(x+1, y)
  move(x, y+1, steps.dup) unless wall?(x, y+1)
end

move(1, 1, Set.new)

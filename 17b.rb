require 'digest/md5'

input = "vwbaicqe"
$open = "bcdef"
$sols = []

def explore(str, x, y, count)
  return ($sols << str; true) if x == 3 && y == 3

  doors = Digest::MD5.hexdigest(str)[0...4].chars

  explore(str + ?U, x, y-1, count+1) if y > 0 && $open.index(doors[0])
  explore(str + ?D, x, y+1, count+1) if y < 3 && $open.index(doors[1])
  explore(str + ?L, x-1, y, count+1) if x > 0 && $open.index(doors[2])
  explore(str + ?R, x+1, y, count+1) if x < 3 && $open.index(doors[3])
end

explore(input, 0, 0, 0)

p $sols.sort_by {|x| x.size }.last.size - input.size

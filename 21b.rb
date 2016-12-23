input = DATA.read
str = "fbgdceah"

def left(str, amt)
  str[amt..-1] + str[0...amt]
end

input.lines.reverse.each do |line|
  puts str
  case line
  when /move position (\d+) to position (\d+)/
    a = $2.to_i
    tmp = str[a]
    str = str[0...a] + str[a+1..-1]
    str = str.insert($1.to_i, tmp)
  when /swap position (\d+) with position (\d+)/
    a, b = $1.to_i, $2.to_i
    tmp, str[b] = str[b], str[a]
    str[a] = tmp
  when /reverse positions (\d+) through (\d+)/
    str = str[0...$1.to_i] + str[$1.to_i..$2.to_i].reverse + str[($2.to_i+1)..-1]
  when /rotate right (\d+) steps?/
    str = left(str, $1.to_i)
  when /rotate left (\d+) steps?/
    str = left(str, -$1.to_i)
  when /rotate based on position of letter (\w)/
    val = str.index($1)
    case val
    when 0
      str = left(str, 1)
    when 1
      str = left(str, 1)
    when 2
      str = left(str, -2)
    when 3
      str = left(str, 2)
    when 4
      str = left(str, -1)
    when 5
      str = left(str, 3)
    when 6
    when 7
      str = left(str, 4)
    else
      raise line
    end
  when /swap letter (\w) with letter (\w)/
    a, b = str.index($1), str.index($2)
    tmp, str[b] = str[b], str[a]
    str[a] = tmp
  else
    raise line
  end
end

puts str

=begin
0,1
1,3
2,5
3,7
4,2
5,4
6,6
7,0


x = <<-STR
a_______
_a______
__a_____
___a____
____a___
_____a__
______a_
_______a
STR

x.each_line do |str|
    str.strip!
    val = str.index("a")
    str = str[-1..-1] + str[0...-1]
    str = str[-val..-1] + str[0...-val]
    if val >= 4
      str = str[-1..-1] + str[0...-1]
    end
    puts str
end
=end

__END__
move position 2 to position 1
move position 2 to position 5
move position 2 to position 4
swap position 0 with position 2
move position 6 to position 5
swap position 0 with position 4
reverse positions 1 through 6
move position 7 to position 2
rotate right 4 steps
rotate left 6 steps
rotate based on position of letter a
rotate based on position of letter c
move position 2 to position 0
swap letter d with letter a
swap letter g with letter a
rotate left 6 steps
reverse positions 4 through 7
swap position 6 with position 5
swap letter b with letter a
rotate based on position of letter d
rotate right 6 steps
move position 3 to position 1
swap letter g with letter a
swap position 3 with position 6
rotate left 7 steps
swap letter b with letter c
swap position 3 with position 7
move position 2 to position 6
swap letter b with letter a
rotate based on position of letter d
swap letter f with letter b
move position 3 to position 4
rotate left 3 steps
rotate left 6 steps
rotate based on position of letter c
move position 1 to position 3
swap letter e with letter a
swap letter a with letter c
rotate left 2 steps
move position 6 to position 5
swap letter a with letter g
rotate left 5 steps
reverse positions 3 through 6
move position 7 to position 2
swap position 6 with position 5
swap letter e with letter c
reverse positions 2 through 7
rotate based on position of letter e
swap position 3 with position 5
swap letter e with letter d
rotate left 3 steps
rotate based on position of letter c
move position 4 to position 7
rotate based on position of letter e
reverse positions 3 through 5
rotate based on position of letter h
swap position 3 with position 0
swap position 3 with position 4
move position 7 to position 4
rotate based on position of letter a
reverse positions 6 through 7
rotate based on position of letter g
swap letter d with letter h
reverse positions 0 through 3
rotate right 2 steps
rotate right 6 steps
swap letter a with letter g
reverse positions 2 through 4
rotate based on position of letter e
move position 6 to position 0
reverse positions 0 through 6
move position 5 to position 1
swap position 5 with position 2
rotate right 3 steps
move position 3 to position 1
rotate left 1 step
reverse positions 1 through 3
rotate left 4 steps
reverse positions 5 through 6
rotate right 7 steps
reverse positions 0 through 2
move position 0 to position 2
swap letter b with letter c
rotate based on position of letter d
rotate left 1 step
swap position 2 with position 1
swap position 6 with position 5
swap position 5 with position 0
swap letter a with letter c
move position 7 to position 3
move position 6 to position 7
rotate based on position of letter h
move position 3 to position 0
move position 4 to position 5
rotate left 4 steps
swap letter h with letter c
swap letter f with letter e
swap position 1 with position 3
swap letter e with letter b
rotate based on position of letter e

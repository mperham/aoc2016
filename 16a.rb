input = "10001110011110000"

length = 272
size = 0
str = input.dup
while str.size < length
  str = str + "0" + str.reverse.gsub(/1/, 'x').gsub(/0/, '1').gsub('x', '0')
end
str = str[0...length]
chk = str
loop do
  chk = chk.chars.each_slice(2).map do |arr|
    arr[0] == arr[1] ? '1' : '0'
  end.join
  break if chk.size.odd?
end

p [str.size, chk]

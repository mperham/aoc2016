input = DATA.read
regs = {
  'a' => 0,
  'b' => 0,
  'c' => 1,
  'd' => 0,
}


ip = 0
input = input.lines.to_a
loop do
  line = input[ip]
  break unless line

  case line
  when /inc (\w)/
    regs[$1] += 1
  when /dec (\w)/
    regs[$1] -= 1
  when /cpy (\d+) (\w)/
    regs[$2] = Integer($1)
  when /cpy (\w) (\w)/
    regs[$2] = regs[$1]
  when /jnz (\w) (-?\d+)/
    if regs[$1] != 0
      ip += Integer($2)
      next
    end
  when /jnz (\d+) (-?\d+)/
    if Integer($1) != 0
      ip += Integer($2)
    end
    next
  else
    raise line
  end
  ip += 1
end

puts "Done"
p regs


__END__
cpy 1 a
cpy 1 b
cpy 26 d
jnz c 2
jnz 1 5
cpy 7 c
inc d
dec c
jnz c -2
cpy a c
inc a
dec b
jnz b -2
cpy c b
dec d
jnz d -6
cpy 16 c
cpy 12 d
inc a
dec d
jnz d -2
dec c
jnz c -5

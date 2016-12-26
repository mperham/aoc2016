input = DATA.read
regs = {
  'a' => 0,
  'b' => 0,
  'c' => 0,
  'd' => 0,
}

$valid = 1
$count = 0
$a = 0

def output(value)
  p [$valid,value]
  if $valid == 1 && value == 0
    $valid = value
  elsif $valid == 0 && value == 1
    $valid = value
  else
    puts "Resetting #{$a}"
    throw :reset
  end
  $count += 1
  if $count > 1_000
    throw :done
  end
end

input = input.lines.to_a
catch :done do
  loop do
    $a += 1
    regs['a'] = $a
    $count = 0
    $valid = 1
    ip = 0
    catch :reset do
      loop do
        line = input[ip]
        #puts line
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
        when /jnz (\D) (-?\d+)/
          if regs[$1] != 0
            ip += Integer($2)
            next
          end
        when /jnz (\d+) (-?\d+)/
          if Integer($1) != 0
            diff = Integer($2)
            raise line if diff == 0
            ip += diff
            next
          end
        when /out (\w)/
          output(regs[$1])
        else
          raise line
        end
        ip += 1
        #puts ip
      end

      puts $a
    end
  end

end

puts "Works: #{$a}"

__END__
cpy a d
cpy 9 c
cpy 282 b
inc d
dec b
jnz b -2
dec c
jnz c -5
cpy d a
jnz 0 0
cpy a b
cpy 0 a
cpy 2 c
jnz b 2
jnz 1 6
dec b
dec c
jnz c -4
inc a
jnz 1 -7
cpy 2 b
jnz c 2
jnz 1 4
dec b
dec c
jnz 1 -4
jnz 0 0
out b
jnz a -19
jnz 1 -21

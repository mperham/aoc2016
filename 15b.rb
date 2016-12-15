discs = [
  [0, 5, 2],
  [1, 13, 7],
  [2, 17, 10],
  [3, 3, 2],
  [4, 19, 9],
  [5, 7, 0],
  [6, 11, 0],
]

count = 0
loop do
  (puts count; break) if discs.all? do |disc|
    (disc[2] + count + (disc[0] + 1)) % disc[1] == 0
  end
  count += 1
end

__END__
Disc #1 has 5 positions; at time=0, it is at position 2.
Disc #2 has 13 positions; at time=0, it is at position 7.
Disc #3 has 17 positions; at time=0, it is at position 10.
Disc #4 has 3 positions; at time=0, it is at position 2.
Disc #5 has 19 positions; at time=0, it is at position 9.
Disc #6 has 7 positions; at time=0, it is at position 0.

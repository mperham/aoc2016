input = "...^^^^^..^...^...^^^^^^...^.^^^.^.^.^^.^^^.....^.^^^...^^^^^^.....^.^^...^^^^^...^.^^^.^^......^^^^"
width = input.size
rows = []
rows << [nil, input.chars, nil].flatten

def trap?(tri)
  return true if tri[0] == ?^ && tri[1] == ?^ && tri[2] != ?^
  return true if tri[0] != ?^ && tri[1] == ?^ && tri[2] == ?^
  return true if tri[0] == ?^ && tri[1] != ?^ && tri[2] != ?^
  return true if tri[0] != ?^ && tri[1] != ?^ && tri[2] == ?^
  return false
end

while rows.size < 40
  prev = rows.size - 1
  row = [nil]
  width.times do |idx|
    three = [rows[prev][idx], rows[prev][idx+1], rows[prev][idx+2]]
    row[idx+1] = trap?(three) ? '^' : '.'
  end
  row << nil
  puts row.size
  rows << row
end

safe = 0
rows.each {|row| puts row.join; row.each {|tile| safe += 1 if tile == '.' }}
puts "Grid: #{width}x40 = #{width*40} tiles, #{safe} are safe"

input = "L2, L5, L5, R5, L2, L4, R1, R1, L4, R2, R1, L1, L4, R1, L4, L4, R5, R3, R1, L1, R1, L5, L1, R5, L4, R2, L5, L3, L3, R3, L3, R4, R4, L2, L5, R1, R2, L2, L1, R3, R4, L193, R3, L5, R45, L1, R4, R79, L5, L5, R5, R1, L4, R3, R3, L4, R185, L5, L3, L1, R5, L2, R1, R3, R2, L3, L4, L2, R2, L3, L2, L2, L3, L5, R3, R4, L5, R1, R2, L2, R4, R3, L4, L3, L1, R3, R2, R1, R1, L3, R4, L5, R2, R1, R3, L3, L2, L2, R2, R1, R2, R3, L3, L3, R4, L4, R4, R4, R4, L3, L1, L2, R5, R2, R2, R2, L4, L3, L4, R4, L5, L4, R2, L4, L4, R4, R1, R5, L2, L4, L5, L3, L2, L4, L4, R3, L3, L4, R1, L2, R3, L2, R1, R2, R5, L4, L2, L1, L3, R2, R3, L2, L1, L5, L2, L1, R4"
steps = input.split(",").map(&:strip)
dir = :north
coords = [0, 0]

Change = {
  :north => {
    "L" => :west,
    "R" => :east,
  },
  :west => {
    "L" => :south,
    "R" => :north,
  },
  :south => {
    "L" => :east,
    "R" => :west,
  },
  :east => {
    "L" => :north,
    "R" => :south,
  },
}

Funk = {
  :north => ->(amt){ coords[1] += amt },
  :south => ->(amt){ coords[1] -= amt },
  :east => ->(amt){ coords[0] += amt },
  :west => ->(amt){ coords[0] -= amt },
}

steps.each do |step|
  turn, amt = step[0], step[1..-1]
  dir = Change[dir][turn]
  Funk[dir].call(amt.to_i)
end

puts("#{coords[0].abs + coords[1].abs} blocks away")


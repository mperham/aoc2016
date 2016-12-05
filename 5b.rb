require "digest/md5"

input = "ffykfhsq"
password = []
idx = 0
curr = ""

while curr.size < 8 && idx < 1_000_000_000
  cand = input + idx.to_s
  idx += 1
  hash = Digest::MD5.hexdigest(cand)
  next unless hash.start_with?("00000")

  slot = Integer(hash[5]) rescue next
  next unless slot < 8
  password[slot] || password[slot] = hash[6]
  curr = password.join
end

puts curr

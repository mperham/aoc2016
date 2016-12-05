require "digest/md5"

input = "ffykfhsq"
password = []
idx = 0

while password.size < 8 && idx < 1_000_000_000
  cand = input + idx.to_s
  idx += 1
  hash = Digest::MD5.hexdigest(cand)
  next unless hash.start_with?("00000")
  password << hash[5]
end

puts password.join

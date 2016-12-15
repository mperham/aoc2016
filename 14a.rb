require 'digest/md5'

input = "cuanljph"
#input = "abc"

hex = '0123456789abcdef'
hex3 = []
hex.each_char do |chr|
  hex3 << chr * 3
end

def basic_hash(str)
  Digest::MD5.hexdigest(str)
end

num = 0
count = 0
loop do
  hash = basic_hash(input + count.to_s)
  triple = hex3.detect { |triple| hash.index(triple) ? triple : nil }
  if triple
    chr = triple[0]
    1000.times do |idx|
      hash2 = basic_hash(input + (count + idx + 1).to_s)
      if hash2.index(chr * 5)
        puts "Key #{num}: #{count} #{hash} with #{count + idx + 1} #{hash2}"
        num += 1
        exit if num == 70
        break
      end
    end
  end
  count += 1
end

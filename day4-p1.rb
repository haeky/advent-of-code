require 'digest/md5'

input = "yzbqklnj"
zeros = 5
index = 0

loop do
  hash = Digest::MD5.hexdigest(input + index.to_s)
  if hash.start_with?("0"*zeros)
    p index
    exit
  end
  index += 1
end

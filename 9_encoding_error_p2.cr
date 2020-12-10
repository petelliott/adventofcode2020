lines = [] of Int64
STDIN.each_line do |line|
  lines << line.to_i64
end

target = 0_i64
(25..(lines.size-1)).each do |i|
  soln = false
  ((i-25)..(i-1)).each do |j|
    ((i-25)..(i-1)).each do |k|
      if lines[j] + lines[k] == lines[i] && j != k
        soln = true
      end
    end
  end
  if !soln
    target = lines[i]
    break
  end
end

def cumsum(arr)
  cum = 0_i64
  arr.map do |n|
    cum += n
    cum
  end
end

cs = cumsum(lines)

hash = Hash(Int64,Int64).new
cs.each_with_index do |sum, idx|
  hash[sum] = idx.to_i64
end

lo = 0_i64
hi = 0_i64
cs.each_with_index do |sum, idx|
  val = hash[target+sum]?
  if !val.nil? && val != idx+1
    slice = lines[(idx+1)..val]
    puts slice.min + slice.max
    break
  end
end

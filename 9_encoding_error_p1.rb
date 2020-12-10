lines = STDIN.read.split("\n").map do |line|
  line.to_i
end


for i in 25..(lines.count-1)
  soln = false
  for j in (i-25)..(i-1)
    for k in (i-25)..(i-1)
      if lines[j] + lines[k] == lines[i] && j != k
        soln = true
      end
    end
  end
  if not soln
    puts lines[i]
    break
  end
end

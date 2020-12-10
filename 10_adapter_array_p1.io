nums := List clone
File clone openForReading("/dev/stdin") foreachLine(v,
  nums append(v asNumber)
)

nums sortInPlace

j1 := 0
j3 := 0

diff := nums at(0)
(diff == 1) ifTrue(j1 = j1 + 1)
(diff == 3) ifTrue(j3 = j3 + 1)

nums foreach(i, v,
  diff := if(nums at(i+1), nums at(i+1), v+3) - v
  (diff == 1) ifTrue(j1 = j1 + 1)
  (diff == 3) ifTrue(j3 = j3 + 1)
)

writeln(j1*j3)

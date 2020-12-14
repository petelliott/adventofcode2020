import Swift

func solve(list:[[String]]) -> Int {
     var l = list
     var change = false
     repeat {
        change = false
        var copy = l
        for y in 1...(l.count - 2) {
            for x in 1...(l[0].count - 2) {
                var scount = 0
                for dy in -1...1 {
                    for dx in -1...1 {
                        let ch = l[y+dy][x+dx];
                        if ((dy != 0 || dx != 0) && ch == "#") {
                            scount += 1;
                        }
                    }
                }
                if (l[y][x] == "L" && scount == 0) {
                   change = true
                   copy[y][x] = "#"
                } else if (l[y][x] == "#" && scount >= 4) {
                   change = true
                   copy[y][x] = "L"
                }
            }
        }
        l = copy
    } while(change)


    var result = 0
    for row in l {
        for ch in row {
            if ch == "#" {
                result += 1
            }
        }
    }
    return result
}

var seats:[[String]] = []
while let line = readLine() {
    seats.append(("."+line+".").map{ String($0) })
}
let w = seats[0].count
let pad = Array(repeating: ".", count: seats[0].count)
seats.insert(pad, at: 0)
seats.append(pad)


print(solve(list: seats))
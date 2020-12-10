import "io" for Stdin

class Instruction {
    construct new(op, arg) {
        _count = 0
        _opcode = op
        _argument = arg
    }
    op { _opcode }
    arg { _argument }
    count { _count }
    count=(value) { _count = value }
}

class Simulator {
    construct new(insts) {
        _insts = insts
        _flipped = -1
    }

    flip(idx) {
        _flipped = idx
    }

    simulate1() {
       for (i in _insts) {
           i.count = 0
       }
       var acc = 0
       var pc = 0
       while (true) {
          if (pc >= _insts.count) {
              return [true, acc]
          }
          _insts[pc].count = _insts[pc].count + 1
          if (_insts[pc].count >= 2) {
             return [false, acc]
          }

          if (_flipped == pc) {
              if (_insts[pc].op == "nop") {
                  pc = pc + _insts[pc].arg - 1
              }
          } else if (_insts[pc].op == "acc") {
              acc = acc + _insts[pc].arg
          } else if (_insts[pc].op == "jmp") {
              pc = pc + _insts[pc].arg - 1
          }
          pc = pc + 1
       }
    }

    solve() {
        for (i in 0..._insts.count) {
            flip(i)
            var sol = simulate1()
            if (sol[0]) {
                return sol[1]
            }
        }
        return -1
    }
}

var instructions = []

var line = Stdin.readLine()
while (line != "") {
    var s = line.split(" ")
    instructions.add(Instruction.new(s[0], Num.fromString(s[1])))
    line = Stdin.readLine()
}

var sim = Simulator.new(instructions)
System.print(sim.solve())

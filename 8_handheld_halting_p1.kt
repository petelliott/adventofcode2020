data class Instruction(val op: String, val arg: Int) {
     var runs: Int = 0
}

fun main() {
    var insts = ArrayList<Instruction>()
    for (line in generateSequence(::readLine)) {
        var sp = line.split(" ");
        insts.add(Instruction(sp[0],sp[1].toInt()))
    }

    var pc = 0
    var acc = 0
    while(true) {
        var inst = insts.get(pc)
        //println("$pc, ${inst.op} ${inst.arg}")
        inst.runs++
        if (inst.runs >= 2) {
           break
        }

        if (inst.op == "acc") {
            acc += inst.arg
        } else if (inst.op == "jmp") {
            pc += inst.arg - 1
        }
        pc++
    }
    println(acc)
}
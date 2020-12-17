import scala.collection.immutable.HashMap

var line = ""
var fixed:Long = 0
var floating_mask:Long = 0
var floating = Array[Long]();
var map = HashMap[Long, Long]()

while ({line = scala.io.StdIn.readLine(); line != null}) {
    val split = line.split("=");
    if (split(0) == "mask ") {
        floating_mask = 0
        fixed = 0
        floating = Array[Long]()
        for ((ch,idx) <- split(1).trim().reverse.zipWithIndex) {
            if (ch == 'X') {
                floating_mask |= 1L << idx
                floating ++= Array[Long](idx)
            } else if (ch == '1') {
                fixed |= 1L << idx
            }
        }
    } else {
      var addr:Long  = split(0).split("\\[")(1).split("\\]")(0).toLong
      val value:Long = split(1).trim.toLong

      addr = (addr & ~floating_mask) | fixed
      for (i <- 0L until 1 << floating.length) {
          var real_addr = addr
          for ((off, idx) <- floating.zipWithIndex) {
              real_addr |= ((i >> idx) & 1) << off
          }
          map += (real_addr -> value)
      }
    }
}

var total: Long = 0
for ((k,v) <- map) {
    total += v
}
println(total)
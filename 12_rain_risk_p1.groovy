
def north = 0
def east = 0
def theta = 0

def reader = System.in.newReader()
def line = ""
while (line = reader.readLine()) {
    def cmd = line[0]
    def arg = Integer.parseInt(line.substring(1))
    if (cmd == 'N') {
        north += arg
    } else if (cmd == 'S') {
        north -= arg
    } else if (cmd == 'E') {
        east += arg
    } else if (cmd == 'W') {
        east -= arg
    } else if (cmd == 'L') {
        theta += arg
    } else if (cmd == 'R') {
        theta -= arg
    } else if (cmd == 'F') {
        north += Math.round(arg*Math.sin(Math.toRadians(theta)))
        east  += Math.round(arg*Math.cos(Math.toRadians(theta)))
    }
}

println Math.abs(north) + Math.abs(east)
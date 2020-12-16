import 'dart:io';
import 'dart:math';


rot2(n, e, theta) {
  final t = theta * pi / 180;
  var eprime = e*cos(t) - n*sin(t);
  var nprime = e*sin(t) + n*cos(t);
  return [nprime.round(), eprime.round()];
}

void main() {
    var north = 0;
    var east = 0;
    var wayn = 1;
    var waye = 10;

    var line = "";
    while((line = stdin.readLineSync()) != null) {
        var cmd = line[0];
        var arg = int.parse(line.substring(1));
        if (cmd == 'N') {
            wayn += arg;
        } else if (cmd == 'S') {
            wayn -= arg;
        } else if (cmd == 'E') {
            waye += arg;
        } else if (cmd == 'W') {
            waye -= arg;
        } else if (cmd == 'F') {
            north += wayn*arg;
            east += waye*arg;
        } else if (cmd == 'L') {
            final new_coord = rot2(wayn, waye, arg);
            wayn = new_coord[0];
            waye = new_coord[1];
        } else if (cmd == 'R') {
            final new_coord = rot2(wayn, waye, -arg);
            wayn = new_coord[0];
            waye = new_coord[1];
        }
    }
    print(north.abs() + east.abs());
}

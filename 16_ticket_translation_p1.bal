import ballerina/io;
import ballerina/stringutils;
import ballerina/lang.'int as ints;

public function main() {
    int[][] ranges = [];

    string line = io:readln("");
    while (line != "") {
        string[] clauses = stringutils:split(stringutils:split(line, ":")[1], " or ");
        string[] c1 = stringutils:split(clauses[0], "-");
        string[] c2 = stringutils:split(clauses[1], "-");
        int|error a = ints:fromString(c1[0].trim());
        int|error b = ints:fromString(c1[1].trim());
        int|error c = ints:fromString(c2[0].trim());
        int|error d = ints:fromString(c2[1].trim());
        if (a is int && b is int && c is int && d is int) {
           ranges.push([a,b,c,d]);
        }
        line = io:readln("");
    }
    line = io:readln("");
    line = io:readln("");
    line = io:readln("");
    line = io:readln("");

    line = io:readln("");
    int count = 0;
    while (line != "") {
        int[] nearby = stringutils:split(line, ",").map(function(string x) returns int {
            int|error y = ints:fromString(x);
            if (y is int) {
                return y;
            }
            return -1;
        });
        foreach var thing in nearby {
            var found = false;
            foreach var range in ranges {
                if ((thing >= range[0] && thing <= range[1]) || (thing >= range[2] && thing <= range[3])) {
                    found = true;
                    break;

                }
            }
            if (!found) {
               count += thing;
            }
        }

        line = io:readln("");
    }
    io:println(count);
}
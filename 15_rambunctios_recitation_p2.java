import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        String[] line = s.nextLine().split(",");
        Hashtable<Integer, Integer> last = new Hashtable();

        int turn = 1;
        for (String word : line) {
            int n = Integer.parseInt(word);
            last.put(n,turn);
            ++turn;
        }
        int next = 0;
        for (; turn < 30000000; ++turn) {
            int last_next = next;
            if (last.containsKey(next)) {
                next = turn - last.get(next);
            } else {
                next = 0;
            }
            last.put(last_next, turn);
        }

        System.out.println(next);
    }
}

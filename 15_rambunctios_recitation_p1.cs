class Hello {
    static void Main(string[] args) {
        var line = System.Console.ReadLine().Split(",");
        var last = new System.Collections.Hashtable();

        int turn = 1;
        foreach (string word in line) {
            var n = int.Parse(word);
            last[n] = turn;
            ++turn;
        }
        int next = 0;
        for (; turn < 2020; ++turn) {
            int last_next = next;
            if (last.ContainsKey(next)) {
                next = turn - (int)last[next];
            } else {
                next = 0;
            }
            last[last_next] = turn;
        }

        System.Console.WriteLine(next);
    }
}
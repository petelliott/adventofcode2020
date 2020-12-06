#include <stdio.h>
#include <stdbool.h>

bool table[2048] = {0};

int read_seat() {
    int val = 0;
    if (getchar() == 'B') val |= (1 << 9);
    if (getchar() == 'B') val |= (1 << 8);
    if (getchar() == 'B') val |= (1 << 7);
    if (getchar() == 'B') val |= (1 << 6);
    if (getchar() == 'B') val |= (1 << 5);
    if (getchar() == 'B') val |= (1 << 4);
    if (getchar() == 'B') val |= (1 << 3);
    if (getchar() == 'R') val |= (1 << 2);
    if (getchar() == 'R') val |= (1 << 1);
    if (getchar() == 'R') val |= (1 << 0);
    getchar();
    return val;
}

int main() {
    int ch;
    while ((ch = getc(stdin)) != EOF) {
        ungetc(ch, stdin);
        table[read_seat()] = true;
    }

    bool hit_seat = false;
    for (size_t i = 0; i < 2048; ++i) {
        if (table[i])
            hit_seat = true;

        if (hit_seat && !table[i]) {
            printf("%d\n", i);
            return 0;
        }
    }

    return 1;
}

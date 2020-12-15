import sys
import copy

def view_count(array, x, y):
    count = 0
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            if dx == 0 and dy == 0:
                continue

            cx = x+dx
            cy = y+dy
            while cy >= 0 and cy < len(array) and cx >= 0 and cx < len(array[0]):
                if array[cy][cx] == 'L':
                    break
                elif array[cy][cx] == '#':
                    count += 1
                    break
                cx += dx
                cy += dy
    return count



array = [ list(line.strip()) for line in sys.stdin ]

change = True
while change:
    c = copy.deepcopy(array)
    change = False
    for y, row in enumerate(array):
        for x, ch in enumerate(row):
            count = view_count(array, x, y)
            if ch == 'L' and count == 0:
                c[y][x] = '#'
                change = True
            elif ch == '#' and count >= 5:
                c[y][x] = 'L'
                change = True


    array = c

print(sum(sum(ch == '#' for ch in row) for row in array))

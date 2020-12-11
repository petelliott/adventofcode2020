const fs = require("fs");

const nums = fs.readFileSync(0)
      .toString()
      .split(/\r?\n/)
      .map((l) => parseInt(l))
      .filter((n) => !isNaN(n))
      .sort((a, b) => a-b);

const solve = (list, i, memo) => {
    if (i == list.length - 1) {
        return 1;
    } else if (i >= list.length) {
        return 0;
    }

    if (i in memo) {
        return memo[i];
    }

    let count = 0;
    let target = (i!==-1)? list[i]:0;
    for (let j = i+1; list[j] - target <= 3; ++j) {
        count += solve(list, j, memo);
    }
    memo[i] = count;
    return count;
}

console.log(solve(nums, -1, {}));

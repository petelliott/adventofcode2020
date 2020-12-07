<?PHP

function load_children($tree, $key, &$set) {
    $set[$key] = true;
    if (!array_key_exists($key, $tree)) {
        return;
    }
    foreach ($tree[$key] as $i) {
        load_children($tree, $i, $set);
    }
}

$tree = array();
while($line = fgets(STDIN)) {
    $s1 = explode(" contain ", $line);
    $lhs = explode(" bag", $s1[0])[0];
    foreach (explode(", ", $s1[1]) as $v) {
        $words = explode(" ", $v);
        $rhs = $words[1] . " " . $words[2];
        if (!array_key_exists($rhs, $tree)) {
            $tree[$rhs] = array();
        }
        array_push($tree[$rhs], $lhs);
    }
}

$set = array();
load_children($tree, "shiny gold", $set);

echo sizeof($set)-1;
echo "\n";

?>

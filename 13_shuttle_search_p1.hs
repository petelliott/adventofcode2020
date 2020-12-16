import qualified Data.Text as T

solve time buses =
    let bus = (foldr1 (\x y -> if (x - (time `mod` x)) > (y - (time `mod` y)) then y else x) buses)
    in bus * (bus - (time `mod` bus))

solvestr l1 l2 =
    solve (read l1 :: Integer) (map (\x -> read x :: Integer)
                                (filter (/="x")
                                    (map T.unpack (T.splitOn (T.pack ",") (T.pack l2)))))

main = do
    line1 <- getLine
    line2 <- getLine
    print (solvestr line1 line2)

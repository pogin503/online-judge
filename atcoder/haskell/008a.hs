main = do
  n <- getLine
  let n1 = read n :: Int
  putStrLn $ show $ calc n1

calc :: Int -> Int
calc n = (n `div` 10) * 100 + (if mod n 10 > 6
                               then 100
                               else (mod n 10) * 15)

{-
7 -> 105
10 -> 100

16 -> 100 +
-}

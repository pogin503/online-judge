problem16 :: String -> Int -> Int
problem16 [] acc = acc
problem16 (x : xs) acc = toInt [x] + problem16 xs acc

problem16_1 :: String -> Int -> Int
problem16_1 xs acc = foldr (\ x -> (+) (toInt [x])) acc xs

toInt :: String -> Int
toInt = read

main :: IO ()
main = do
  let x = show (truncate ((2 ** 1000) :: Double) :: Integer)
  print $ problem16 x 0

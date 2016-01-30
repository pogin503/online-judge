-- import Debug.Trace

problem_1 :: Int
problem_1 =
    -- let dbg = trace (show x) in
    sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]

sum0netoN :: Int -> Int
sum0netoN n = n * (n + 1) `div` 2

problem_1_1 :: Int
problem_1_1 = sumStep 3 999 + sumStep 5 999 - sumStep 15 999
              where
                sumStep s n = s * sum0netoN (n `div` s)

main :: IO ()
main = do
  print problem_1
  print problem_1_1

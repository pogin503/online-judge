main :: IO ()
main = do
  let x = sum $ map (\x1 -> x1 * x1) [1..100]
      sum1 :: Integer
      sum1 = sum [1..100]
  putStrLn $ show $ (sum1 * sum1) - x
-- 25164150

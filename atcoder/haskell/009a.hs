import Control.Applicative

main = do
  n <- getLine
  -- items <- lines <$> getContents
  -- let items1 = map words items
  -- -- print contents
  -- -- let itemSet = map (\x ->
  -- --                 -- if null x /= True
  -- --                 -- then
  -- --                     let x1 = words x
  -- --                      in (head x1, last x1)) (lines <$> getContents :: IO String)
  -- --                 -- else ("0", "0")) ()
  -- -- contents <- getContents
  -- putStrLn $ show items1
  xs <- floor . (*1.05) . sum . map g . map f . lines <$> getContents
  print xs

f :: String -> (Double , Double)
f x = (p,q)
    where
      list = words x
      p = read $ head list
      q = read . head . tail $ list

g :: (Double,Double) -> Double
g (p,q) = p*q

main1 :: IO ()
main1 = do
  n <- read <$> getLine :: IO Int
  main' n 0

main' :: Int -> Int -> IO ()
main' n acc = do
  s <- f1 . (map read) . words <$> getLine :: IO Int
  if n > 1
  then main' (n - 1) (acc + s)
  else putStrLn $ show $ floor $ (fromIntegral (acc + s)) * (1.05 :: Double)

f1 :: [Int] -> Int
f1 [x, y] = y * x

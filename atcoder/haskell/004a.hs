{- http://arc004.contest.atcoder.jp/submissions/35275 -}
{- http://arc004.contest.atcoder.jp/submissions/23137 -}

import System.IO
import Control.Applicative
import Control.Monad

takePoint :: String -> (Double, Double)
takePoint str = (read $ (words str) !! 0, read $ (words str) !! 1)

main = do
  n <- read <$> getLine
  pointList <- map takePoint <$> replicateM n getLine
  putStrLn $ show $ maximum $ map (\((x1, y1), (x2, y2)) -> sqrt((x1 - x2)^2 + (y1 - y2)^2)) [(p, q) | p <- pointList, q <- pointList, p /= q]

solve1 = do
  times <- readLn
  points <- replicateM times (words <$> getLine)
  print $ maximum $ map distance $ comb points

distance :: ([Double], [Double]) -> Double
distance ([x1, y1], [x2, y2]) = sqrt $ (x2 - x1)^^2 + (y2 - y1)^^2
distance _ = 0

comb xs = [(map read x, map read y) | x <- xs, y <- xs, x < y]

solve2 = getLine>>getContents>>= print.solve2'.toPairs.map read.words

toPairs [] = []
toPairs (x:y:xs) = (x, y):toPairs xs

solve2' :: [(Int, Int)] -> Double
solve2' xys = maximum [dis p q | p <- xys, q <- xys]

dis (x0, y0) (x1, y1) = sqrt . fromIntegral $ (x1 - x0) + (y1 - y0)

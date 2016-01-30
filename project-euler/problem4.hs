import Data.List
import Data.Ord (comparing)

isPalindrome :: Int -> Bool
isPalindrome xs = show xs == reverse (show xs)

palindromeList :: [(Int, (Int, Int))]
palindromeList =
  let lst = [(x, y)| x <- [100..999], y <- [100..999]] :: [(Int, Int)]
      tpl :: [(Int, (Int, Int))]
      tpl = map (\x -> ((uncurry (\y z -> y * (toInt $ reverse $ show (z :: Int))) x), x)) lst
      tplFilterd = filter (isPalindrome . fst) tpl
  in sortBy (comparing fst) tplFilterd

solve :: (Int, (Int, Int))
solve = maximumBy (comparing fst) palindromeList

toInt :: String -> Int
toInt = read

main :: IO ()
main = print $ fst solve

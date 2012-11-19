import Prelude
import Data.List

main = do
  str <- getLine
  let n = head $ words str
      m = last $ words str
  name <- getLine
  kit <- getLine
  print $ test1 name kit


-- Nを取ったらそれをkitの中から一致するか見る(find)
-- nameの文字の数を数える。文字数のいるやつを求める
-- それぞれ文字数を数えて
-- findStr :: Char -> String -> Maybe Int

-- findStr c str
--  | (findIndex ( == c) str) == 1 = 1
--  | otherwise = 0
test1 :: String -> String -> Int
test1 str1 str2 = solve str1 str2 0
    where
      -- sorted1 = map nub $ group $ sort str1
      -- sorted2 = sort str2
      -- res1 = str1 \\ str2
      check str1 str2 = case elemIndex Nothing (map (\x -> elemIndex x str2) str1) of
                          Just _ -> False
                          Nothing -> True
      strSub str1 str2 = str1 \\ str2
      solve str1 str2 n =
          let result = strSub str1 str2
              checkResult = check str1 str2
          in if checkResult == False && n == 0
             then -1
             else if result == []
                  then n + 1
                  else solve result str2 (n + 1)

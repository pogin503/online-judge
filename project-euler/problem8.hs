import Debug.Trace

str :: String
str = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"

solve :: String -> ([Int], Int) -> ([Int], Int)
solve [] (acc, accRes) = (acc, accRes)
solve (_:_:_:_:[]) (acc, accRes)  = (acc, accRes)
solve (x1:x2:x3:x4:x5:xs) (acc, accRes) =
  -- (readArg [x1, x2, x3, x4, x5], product res)
  -- if isAllTrue res
  -- then trace (show acc ++ " " ++ show accRes ) $ solve (x2:x3:x4:x5:xs) $
  --                              if product res < accRes
  --                              then (acc, accRes)
  --                              else (res, product res)

  -- else solve (tail q) (acc, accRes)
  -- trace (show acc ++ " " ++ show accRes ) $
        solve (x2:x3:x4:x5:xs) $
              if product res < accRes
              then (acc, accRes)
              else (res, product res)
  where
    readArg :: String -> [Int]
    readArg q' = map (\x -> read [x] :: Int) q'
    res :: [Int]
    res = readArg [x1, x2, x3, x4, x5]

-- |
-- >>> solve str ([0],0)
-- ([9,9,8,7,9],40824)

-- 使わなかった
isAllTrue :: [Int] -> Bool
isAllTrue [] = False
isAllTrue (_:[]) = True
isAllTrue (x:xs) = if x >= head xs then False else isAllTrue xs

-- |
-- >>> isAllTrue [1,2,3,4,5]
-- True
-- >>> isAllTrue [3,2,3,3,3]
-- False
-- >>> isAllTrue [1,2]
-- True
-- >>> isAllTrue [2,1]
-- False
-- >>> isAllTrue [6,6,6,8,8]
-- False
-- >>> isAllTrue [9,9,7,9,8]
-- False
-- >>> isAllTrue [1,3,7,8,9]
-- True

-- Tips
-- read で Char型を読み込まないと行けない場合は [x]というふうにして型を合わせる Char から [Char]に型を変更する
main :: IO ()
main = print $ solve str ([1, 2, 3, 4, 5], 0)

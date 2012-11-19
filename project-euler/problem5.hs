import Data.List

check :: Integral a => a -> [a] -> Bool
check x xs = (and (map (\x1 -> if (mod x x1 == 0) then True else False)
                       xs))

check1 :: Integral a => a -> Bool
check1 x = and (map (\x1 -> if (mod x x1 == 0) then True else False)
              [1..20])

check2 :: Integral a => a -> [a] -> (Bool, a)
check2 x xs = (and (map (\x1 -> if (mod x x1 == 0)
                                then True
                                else False)
                    xs), x)

-- solve = do
--   let t =
--   elemIndex True $ map (\x -> check2 x [1..20])

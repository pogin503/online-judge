f1 x = [x1 | x1 <- [1..(div x 2)], mod x x1 == 0]
-- |
-- >>>f1 10
-- [1,2,5]

sigma2 n = sum $ (map (^2) (f1 n)) ++ [n^2]
-- |
-- >>>sigma2 6
-- 50

main = undefined

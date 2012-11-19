-- fib :: Int -> Int
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-2) + fib (n-1)
-- fibList :: [Int] -> [Int]

fibList :: Int -> [Int]
fibList 0 = [1]
fibList 1 = [1, 1]
fibList n = fibList (n-1) ++ [fib n]

-- |
-- >>> take 10 fibZip
-- [1,1,2,3,5,8,13,21,34,55]
fibZip :: [Int]
fibZip = 1:1:zipWith (+) fibZip (tail fibZip)

-- |
-- >>> fibZip1 10
-- [1,1,2,3,5,8,13,21,34,55]
fibZip1 :: Int -> [Int]
fibZip1 n = take n (1:1:zipWith (+) fibZip (tail fibZip))

-- fibZip2 = [(x, y) | x <- n, y <- [1..25]]
--           where
--             n = fibZip
-- fibList = [x | x <- (x1:x2:)]
-- main = print (fib 20)

-- problem2 :: Int
-- problem2 = sum [x | x <- pri, even x]
--            where
--              pri = fib 100

problem2 :: Int
problem2 = sum [x | x <- takeWhile (<= 10000000) fibZip, even x]
-- |
-- >>>problem2
-- 4613732
main = undefined

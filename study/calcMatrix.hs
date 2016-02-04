-- @see http://blog.so-net.ne.jp/user_localhost_sec/2010-07-08

mxA = [[1,2],
       [3,4],
       [5,6]]

mxB = [[2,3,4],
       [3,4,5]]
       
main :: IO ()
main = print $ mxB /**/ mxA

-- | /*/ test
-- >>> 5 /*/ mxA
-- [[5,10],[15,20],[25,30]]
-- 行列とスカラの積算
(/*/) :: Int -> [[Int]] -> [[Int]]
(/*/) a mx = map (\x -> a /* x) mx

-- | /**/ test
-- >>> mxA /**/ mxB
-- [[8,11,14],[18,25,32],[28,39,50]]
-- 行列どうしの積算
(/**/) :: [[Int]] -> [[Int]] -> [[Int]]
(/**/) mx my = let tmy = transpose my -- 転置行列を作る
               in if length tmy == length mx  --    (行 × 列) m1 × n1 (n2 × m)
                                              --    length n1 == length n2
                  then cutArray (length mx) $ inMulti mx $ transpose my
                  else []
                      where
                        inMulti :: [[Int]] -> [[Int]] -> [Int]
                        inMulti mx my = do x <- mx
                                           y <- my
                                           [x /** y]
-- |
-- >>>cutArray 2 [1,2,3,4]
-- [[1,2],[3,4]]
-- 配列から行列への変換
cutArray :: Int -> [Int] -> [[Int]]
cutArray len xs | xs == [] = []
                | True = [(take len xs)] ++ (cutArray len $ reverse $ take ((length xs) - len) $ reverse xs)

-- | /++/ test
-- >>>[[1,2],[3,4]] /++/ [[4,3], [2,1]]
-- [[5,5],[5,5]]
-- 行列どうしの加算
(/++/) :: [[Int]] -> [[Int]] -> [[Int]]
(/++/) mx my = if (length mx) == (length my) then mxAdd mx my else []
    where
      mxAdd :: [[Int]] -> [[Int]] -> [[Int]]
      mxAdd (xs:mx) (ys:my) | mx == [] || my == [] = [xs /++ ys]
                            | True = [xs /++ ys] ++ (mxAdd mx my)

-- | /* test
-- >>> 5 /* head mxA
-- [5,10]
-- >>> 5 /* last mxA
-- [25,30]

-- ベクトルとスカラの積算
(/*) :: Int -> [Int] -> [Int]
(/*) a xs = map (\x -> x * a) xs

-- |
-- >>>[1,2] /++ [2,3]
-- [3,5]
-- ベクトルどうしの加算
(/++) :: [Int] -> [Int] -> [Int]
(/++) xs ys = if (length xs) == (length ys) then aryAdd xs ys else []
    where
      aryAdd :: [Int] -> [Int] -> [Int]
      aryAdd (x:xs) (y:ys) | xs == [] || ys == [] = [x + y]

-- |                           | True = [x + y] ++ (aryAdd xs ys)
-- [1,2] /** [2,3]
-- 8
-- ベクトルどうしの積算
(/**) :: [Int] -> [Int] -> Int
(/**) (x:xs) (y:ys) | xs == [] || ys == [] = (x * y)
                    | True = (x * y) + (xs /** ys)
-- | transpose test
-- >>>transpose mxB
-- [[2,3],[3,4],[4,5]]

-- 行列 A の転置行列を求める
transpose :: [[Int]] -> [[Int]]
transpose matrix = transpose' matrix 1
    where
      transpose' :: [[Int]] -> Int -> [[Int]]
      transpose' mx iterater
          | iterater > (length $ head mx) = []
          | True = map (\x -> head $ reverse $ take iterater x) mx : transpose' mx (iterater + 1)

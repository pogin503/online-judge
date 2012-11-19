import Debug.Trace

primes :: [Int]
primes = sieve [2..]

sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]


sisu :: Integer -> Integer -> Int -> Integer
sisu  x factor counter  =
    if mod x factor == 0
    then trace ("counter = " ++ show counter
                ++ "res =" ++ show (mod x factor)) sisu (div x factor) factor (counter + 1)
    else (toInteger counter) + 1

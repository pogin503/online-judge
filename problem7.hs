main :: IO ()
main = putStrLn $ show $ last $ take 10001 primes'

primes' :: [Integer]
primes' = 2:sieve' [3] [5,7..]

sieve' :: [Integer] -> [Integer] -> [Integer]
sieve' (p:ps) xs = p:sieve' (ps++ps') [x | x <- qs, mod x p /= 0]
  where (ps', qs) = span (<(p*p)) xs

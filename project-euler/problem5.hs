main :: IO ()
main =
  print $ (truncate (sum [1..100] ** 2) :: Integer) - (truncate (sum $ map (** 2) [1..100]))

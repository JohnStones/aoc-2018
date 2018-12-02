import System.Environment

main :: IO ()
main = do
  [inputPath] <- getArgs
  input <- readFile inputPath
  let result = foldl (flip readCommand) 0 (lines input)
  print result

readCommand :: (Num a, Read a) => String -> a -> a
readCommand [] = id
readCommand (op:input)
  | op == '+' = (+) y
  | op == '-' = flip (-) y
  | otherwise = error ("Failed to parse input: `" ++ (op : input) ++ "`")
  where
    y = read input

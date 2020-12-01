-- Importing digitToInt function from Data.Char module
import Data.Char(digitToInt)


-- | Function to check the oddity of the first digit
isOddFirst :: Int -> Bool
isOddFirst x
    | firstDigit `mod` 2 == 1 = True
    | otherwise = False
    where
        firstDigit = digitToInt $ head $ show x

-- Function to count the numbers that start with an odd digit
oddStartingNums :: [Int] -> Int
oddStartingNums xs = length $ filter isOddFirst xs


main = do
    let bigInt = oddStartingNums [1..1000000] :: Int
    let pctg =  show (fromIntegral bigInt * 100 / 1000000) ++ "%"

    print bigInt -- 555556
    putStr pctg -- 55.5556% (indeed, it's 55.5556% !!)

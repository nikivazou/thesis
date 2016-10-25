{-@ LIQUID "--short-names" @-}

{-@ LIQUID "--no-termination" @-}

module Ex (range, range', dup) where

import Data.List (find)

{-@ type Rng Lo Hi = {v:Int | (Lo <= v && v < Hi)} @-} 

{-@ range :: lo:_ -> hi:{v:_ | lo <= v} -> [(Rng lo hi)] / [hi - lo] @-}
range :: Int -> Int -> [Int]
range lo hi 
  | lo <= hi  = lo : range (lo + 1) (hi :: Int)
  | otherwise = []

{-@ range' :: lo:_ -> hi:_ -> [(Rng lo hi)] @-}
range' lo hi = foldn lo hi (:) []  

foldn :: Int -> Int -> (Int -> a -> a) -> a -> a
foldn lo hi f = go lo hi 
  where 
    go i n acc  
      | i < n     = go (i + 1) n (f i acc)
      | otherwise = acc

{-@ findInRange :: _ -> lo:_ -> hi:_ -> Maybe (Rng lo hi) @-}
findInRange f lo hi = find f $ range lo hi

{-@ measure evenL :: [a] -> Prop 
    evenL ([])    = true
    evenL (x:xs)  = not (evenL xs) 
  @-}

{-@ dup    :: [a] -> [a] @-}
dup []     = []
dup (x:xs) = x : x : dup xs 

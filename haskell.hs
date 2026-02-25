data RoseTree a = Rose a [RoseTree a] deriving Show

rose = Rose 3 [Rose 2 [],
               Rose 1 [Rose 5 [Rose 6 []]],
               Rose 4 []]


-- en la funcion del fold, tengo que darle 

foldRose :: (a -> [b] -> b) -> RoseTree a -> b
foldRose f (Rose r rs) = f r (map rec rs)
  where
    rec = foldRose f


-- [[3,2], [3,1,5] , [3,4]]

    
ramas :: RoseTree a -> [[a]]
ramas = foldRose (\x rec -> if null rec -- si no tiene hijos
                            then [[x]] -- casobase
                            else map (x:) (concat rec)) -- recursion

hojas :: RoseTree a -> [a]
hojas = foldRose (\x rec -> if null rec 
                              then [x]
                              else concat rec)     

distancias :: RoseTree a -> [Int]
distancias = foldRose (\x rec -> if null rec 
                                then [0]
                                else map (1+) (concat rec))

-- foldr :: (a -> b -> b) -> b -> [a] -> b

-- foldr f z [] = z
-- foldr f z (x : xs) = f x (foldr f z xs)


pares = [(x,s-x) | s <- [1..], x <- [1..s-1]]



listasQueSuman :: Int -> [[Int]]
listasQueSuman 0 = [[]]
listasQueSuman n | n > 0 = [x : xs | x <- [1..n], xs <- listasQueSuman (n-x)]

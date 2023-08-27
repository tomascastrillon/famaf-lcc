--Ejercicio 1
--Apartado a)
esCero :: Int -> Bool
esCero x = x == 0
--ghci> esCero 2
--False
--ghci> esCero 0
--True


--Apartado b)
esPositivo::Int-> Bool
esPositivo x = x>0
--ghci> esPositivo (-5)
--False
--ghci> esPositivo 1
--True

--Apartado c)
esVocal::Char -> Bool
esVocal x = x=='a'|| x=='e'|| x=='i'|| x=='o'|| x=='u'
--ghci> esVocal 'a'
--True
--ghci> esVocal 'd'
--False

--Apartado d)
valorAbsoluto::Int -> Int
valorAbsoluto x | x>=0 = x  
                | x<0 = -x
--ghci> valorAbsoluto 10
--10
--ghci> valorAbsoluto (-5)
--5

--Ejercicio 2
--Apartado a)
paratodo::[Bool]->Bool
paratodo []=True
paratodo (x:xs) | x = paratodo xs
                | otherwise = False
-- *Main> paraTodo [True,True,True]
-- True
-- *Main> paraTodo [True,False,True]
-- False

--Apartado b)
sumatoria ::[Int]-> Int
sumatoria []= 0
sumatoria (x:xs) = x + sumatoria xs 
-- *Main> sumatoria [1,4,5,7]
--17
-- *Main> sumatoria []
--0

-- Apartado c)
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x* productoria xs
-- *Main> productoria [2,3]
--6
-- *Main> productoria []
--1

-- Apartado d)
factorial :: Int -> Int
factorial 0 = 1
factorial n = n*factorial (n-1)
-- *Main> productoria [2,3]
--6
-- *Main> productoria []
--1

promedio::[Int]->Int
promedio xs = div (sumatoria xs) (length xs)
-- *Main> promedio [8,8,10]
--8
-- *Main> promedio [8,9,10]
--9

-- Ejercico 3
pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs
-- *Main> promedio [8,8,10]
--8
-- *Main> promedio [8,9,10]
--9

--Ejercicio 4
--Apartado a)
paratodo'::[a]->(a->Bool)->Bool
paratodo' [] f= True
paratodo' (x:xs) f | f x = paratodo' xs f
                   | otherwise = False
-- *Main> paratodo' [1,2,3,4,5,(-7)] (>0)
--False
-- *Main> paratodo' [1,2,3,4,5] (>0)
--True

--Apartado b)
existe'::[a] -> (a->Bool)-> Bool
existe' [] f = False
existe' (x:xs) f | f x = True
                 | otherwise = existe' xs f
-- *Main> existe' [1,2,3,4,5] (<1)
--False
-- *Main> existe' [1,2,3,4,5] (==1)
--True

--Apartado c)
sumatoria':: [a] -> (a->Int) -> Int
sumatoria' [] f = 0
sumatoria' (x:xs) f = f x + sumatoria' xs f 
-- *Main> sumatoria' [1,2,3,4,5] (+2)
--25
-- *Main> sumatoria' [1,2,3,4,5] (+3)
--30

--Apartado d)
productoria'::[a]-> (a->Int) -> Int
productoria' [] f = 1
productoria' (x:xs) f = f x * productoria' xs f
-- *Main> productoria' [2,3,4] (+2)
--120
-- *Main> productoria' [(-2),3,4] valorAbsoluto
--24

-- Ejercicio 5 
paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs (==True)
-- *Main> paratodo'' [True,True,False]
--False
-- *Main> paratodo'' [True,True]
--True

--Ejercicio 6
--Apartado a)
todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even
-- *Main> todosPares [2,3,2,4]
--False
-- *Main> todosPares [2,2,4]
--True

--Apartado b)
esMultiplo :: Int -> Int -> Bool
esMultiplo x y = y `mod` x == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n) -- no anda con mod

--Apartado c)
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0..n] (^2)
-- *Main> sumaCuadrados 2
--5
-- *Main> sumaCuadrados 5
--55

--Apartado d)
esDivisor :: Int -> Int -> Bool
esDivisor x y = x `mod` y == 0

existeDivisor:: Int-> [Int] -> Bool
existeDivisor n ls = existe' ls (esDivisor n)
-- *Main> existeDivisor 2 [3,4,5,6]
--False
-- *Main> existeDivisor 2 [1,3,4,5,6]
--True

--Apartado e)
esPrimo :: Int -> Bool
esPrimo n = not (existeDivisor n [2..(n-1)]) -- no optimo preguntar profe

--Apartado f)
factorial' :: Int -> Int
factorial' n = productoria [1..n] -- indirectamene usa recursividad

--Apartado g) 
multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria (filter esPrimo xs) 
-- *Main> multiplicaPrimos [5,7,3,4]
--105
-- *Main> multiplicaPrimos [5,7,3,2]
--210

--Apartado h)
fib :: Int -> Int
fib 1 = 1
fib 2 = 1
fib n = fib (n-1)+fib (n-2)

--esFib :: Int -> Bool
--esFib n = existe' 

--Apartado I)
--todosFib :: [Int] -> Bool
--todosFib xs = paratodo' xs (esFib)

--Ejercicio 7
--Map toma una lista y aplica una funcion f a cada elemento de la lista, construyendo una nueva lista retornandola
--Filter toma una lista y nos devuelve una lista con los elementos que cumplan el predicado t 

-- Equivale a aumentar una unidad cada elemento de la lista, tambien podriamos decir que es equivalente a map (+1) [xs]. 
-- map succ [1, -4, 6, 2, -8] = [2, -3, 7, -7], succ viene de successor

-- Equivale a tomar los elementos de una lista y construir una nueva lista con los elementos que sean positivos.
-- Ej filter esPositivo [1, -4, 6, 2, -8] = [1, 6, 2], o filter (>0) [xs]

-- Ejercicio 8 
-- Apartado a)
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (2*x):duplica xs
-- *Main> duplica [2,3,4]
--[4,6,8]
-- *Main> duplica [1,0,7]
--[2,0,14]

-- Apartado b)
duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs
-- *Main> duplica' [5,3,8]
--[10,6,16]

--Ejercicio 9
--Apartado a)
sonPrimos::[Int]->[Int]
sonPrimos [] = []
sonPrimos (x:xs) | esPrimo x = x : sonPrimos xs
                 | otherwise = sonPrimos xs

--Apartado b)
sonPrimos' :: [Int] -> [Int]
sonPrimos' xs = filter esPrimo xs

--Apartado c)
--Ya mejorada (carita fachera)

-- Ejercicio 10
-- Apartado a)
primIgualesA :: (Eq a) => a -> [a] -> [a]
primIgualesA d [] = []
primIgualesA d (x:xs) | (x==d) = x : primIgualesA d xs
                      | otherwise = []
--ghci> primIgualesA 'q' "dq34"
--""
--ghci> primIgualesA '3' "3334567"
--"333"

-- Apartado b)
primIgualesA' :: (Eq a) => a -> [a] -> [a]
primIgualesA' d xs = takeWhile (==d) xs
--ghci> primIgualesA' 8 [7,3,4,1]
--[]
--ghci> primIgualesA' 8 [8,8,8,0]
--[8,8,8]

--Ejercicio 11
--Apartado a)
primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:xs) | (x==head xs) = x : primIguales xs
                   | otherwise = [x]
--ghci> primIguales "111235"
--"111"
--ghci> primIguales [1,4,5,6]
--[1]

--Apartado b)
primIguales' :: (Eq a) => [a] -> [a]
primIguales' xs = primIgualesA' (head xs) xs    
--ghci> primIguales' "333"
--"333"
--ghci> primIguales' []
--[]        

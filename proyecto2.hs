--Ejercicio 1
--Apartado a)
data Carrera = Matematica | Fisica | Computacion | Astronomia

--Apartado b)
titulo::Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

--Apartado c)
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq,Ord,Show,Bounded)

--Apartado d) 
cifradoAmericano:: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--Ejercicio 2
-- Apartado a) Realizado

--Ejercicio 3
--Aṕartado a)
minimoElemento::Ord a => [a] -> a
minimoElemento [] = error("No listas vacias")
minimoElemento (x:[]) = x
minimoElemento (x:y:xs) | x<y = minimoElemento (x:xs)
                        | otherwise = minimoElemento (y:xs)
--ghci> minimoElemento [1,2,4,300]
--1

--Apartado b)
minimoElemento'::(Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:[]) = x
minimoElemento' (x:y:xs) | x<y = minimoElemento' (x:xs)
                        | otherwise = minimoElemento' (y:xs)
--ghci> minimoElemento' "hola"
--'a'

--Apartado c)
--ghci> minimoElemento [Fa, La, Sol, Re, Fa]
--Re

--Ejercicio 4
--Apartado a)
-- Sinonimos de tipo
type Altura = Int
type NumCamiseta = Int
-- Tipos algebraicos sin parametros (aka enumerados)
data Zona = Arco | Defensa | Mediocampo | Delantera deriving (Eq,Show,Ord)
data TipoReves = DosManos | UnaMano deriving (Eq,Show,Ord)
data Modalidad = Carretera | Pista | Monte | BMX deriving (Eq,Show,Ord)
data PiernaHabil = Izquierda | Derecha deriving (Eq,Show,Ord)
--Sinonimo
type ManoHabil = PiernaHabil
--Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedrecista 
                 | Ciclista Modalidad 
                 | Velocista Altura 
                 | Tenista TipoReves ManoHabil Altura  
                 | Futbolista Zona NumCamiseta PiernaHabil Altura 
                deriving (Show)
--Apartado b)
--ghci> :t Ciclista 
--Ciclista :: Modalidad -> Deportista

--Apartado c) 
contar_velocistas :: [Deportista] -> Int 
contar_velocistas [] = 0
contar_velocistas ((Velocista a):xs) = 1 + contar_velocistas xs
contar_velocistas (x:xs) = contar_velocistas xs 
--ghci> contar_velocistas [(Velocista 185),(Ciclista Pista),(Velocista 190),(Tenista UnaMano Derecha 175)]
--2

--Apartado d)
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas ((Futbolista Arco n p a):xs) Arco = 1+contar_futbolistas xs Arco
contar_futbolistas ((Futbolista Defensa n p a):xs) Defensa = 1+contar_futbolistas xs Defensa
contar_futbolistas ((Futbolista Mediocampo n p a):xs) Mediocampo = 1+contar_futbolistas xs Mediocampo
contar_futbolistas ((Futbolista Delantera n p a):xs) Delantera = 1+contar_futbolistas xs Delantera
contar_futbolistas (_:xs) zn = contar_futbolistas xs zn
--ghci> contar_futbolistas [(Futbolista Defensa 2 Derecha 174),(Ciclista Pista),(Futbolista Arco 1 Izquierda 183),(Tenista UnaMano Derecha 175)] Arco
--1

--Apartado e)
contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' [] z = 0
contar_futbolistas' xs z = length (filter fbenzona xs)
   where
    fbenzona (Futbolista zn _ _ _)= zn == z
    fbenzona _ = False
--ghci> contar_futbolistas' [(Futbolista Defensa 2 Izquierda 174),(Ciclista BMX),(Futbolista Defensa 4 Izquierda 183),(Futbolista Defensa 3 Derecha 175)] Defensa
--3

--Ejercicio 5
--Apartado a)
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--Apartado b)
data Alteracion = Bemol | Natural | Sostenido deriving (Eq)

--Apartado c)
data NotaMusical = Nota NotaBasica Alteracion 

--Apartado d)
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb a)  |(a==Bemol) = (sonidoNatural nb) - 1
                             |(a==Natural) = (sonidoNatural nb) 
                             |(a==Sostenido) = (sonidoNatural nb) +1
--ghci> sonidoCromatico (Nota Mi Bemol)
--3

--Apartado e)
instance Eq NotaMusical
  where
    (==) :: NotaMusical -> NotaMusical -> Bool
    n1==n2 = sonidoCromatico n1 == sonidoCromatico n2

--Apartado f)
instance Ord NotaMusical
  where
    (<=) :: NotaMusical -> NotaMusical -> Bool  
    n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2

--Ejercicio 6
--Apartado a)
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento xs = Just(head xs) 
--ghci> primerElemento []
--Nothing

--Ejercicio 7
data Cola = VaciaC | Encolada Deportista Cola 
             deriving (Show)
--Apartado a)
--1
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ c) = Just c 
--ghci> atender (Encolada Ajedrecista(Encolada (Ciclista Monte)(VaciaC)))
--Just (Encolada (Ciclista Monte) VaciaC)

--2
encolar :: Deportista -> Cola -> Cola
encolar dp VaciaC = Encolada dp VaciaC
encolar dp (Encolada d y) = Encolada d (encolar dp y)
--ghci> encolar Ajedrecista (Encolada Ajedrecista(Encolada (Ciclista Monte)(VaciaC)))
--Encolada Ajedrecista (Encolada (Ciclista Monte) (Encolada Ajedrecista VaciaC))

--3
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _ = Nothing
busca (Encolada (Futbolista z n p a) c) zn   | z==zn = Just (Futbolista z n p a)    
                                             | otherwise = busca c zn
busca (Encolada dp c) zn = busca c zn  
--ghci> busca (Encolada Ajedrecista(Encolada (Futbolista Delantera 9 Izquierda 182)(VaciaC))) Arco
--Nothing
--ghci> busca (Encolada Ajedrecista(Encolada (Futbolista Delantera 9 Izquierda 182)(VaciaC))) Delantera
--Just (Futbolista Delantera 9 Izquierda 182)

--Apartado b)
--Las Colas se parecen a las listas ya que se puede hacer recursion sobre ellas, la diferencia es que son FIFO(First In, First Out).

--Ejercicio 8
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving(Show)

--Apartado a)
type Telefonica = ListaAsoc String Int

--Apartado b)
--1
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo x y ls) = 1+la_long ls
--ghci> la_long (Nodo 3 4(Nodo 8 4(Nodo 1 9(Vacia))))
--3

--2 
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat Vacia Vacia = Vacia
la_concat Vacia ls1 = ls1
la_concat (Nodo x y ls) ls1 = Nodo x y (la_concat ls ls1)
--ghci> la_concat (Nodo 3 4(Nodo 5 6(Vacia)))(Nodo 7 8(Nodo 9 10(Vacia)))
--Nodo 3 4 (Nodo 5 6 (Nodo 7 8 (Nodo 9 10 Vacia)))

--3
la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia x y = (Nodo x y Vacia)
la_agregar (Nodo c v la) x y | c==x = (Nodo c y) la
                             | otherwise = Nodo c v (la_agregar la x y)
--ghci> la_agregar (Nodo "tomi" 1(Nodo "hernan" 10(Vacia))) "abc" 2
--Nodo "tomi" 1 (Nodo "hernan" 10 (Nodo "abc" 2 Vacia))

--4 
la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo x y ls) = (x,y): la_pares ls
--ghci> la_pares (Nodo 't' '1'(Nodo 'x' 'y'(Vacia))) 
--[('t','1'),('x','y')]

--5
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia c = Nothing
la_busca (Nodo x y ls) c | x==c = Just y
                         | otherwise = la_busca ls c
--ghci> la_busca (Nodo 4 5(Nodo 6 7(Vacia))) 6
--Just 7
--ghci> la_busca (Nodo 4 5(Nodo 6 7(Vacia))) 90
--Nothing

--6
--Borra la primera que encuentra
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar c Vacia = Vacia
la_borrar c (Nodo x y ls) | c == x = ls
                          | otherwise = Nodo x y (la_borrar  c ls)
--ghci> la_borrar "tomi" (Nodo "hernan" 5(Nodo "tomi" 6(Nodo "tomi" 8(Vacia))))
--Nodo "hernan" 5 (Nodo "tomi" 8 Vacia)

--Borra todas las que encuentra                
la_borrar' :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar' c Vacia = Vacia
la_borrar' c (Nodo x y ls) | c == x = la_borrar' c ls
                          | otherwise = Nodo x y (la_borrar'  c ls)
--ghci> la_borrar' "tomi" (Nodo "hernan" 5(Nodo "tomi" 6(Nodo "tomi" 8(Vacia))))
--Nodo "hernan" 5 Vacia
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
minimoElemento::Ord a => [a]->a
minimoElemento [] = error("No listas vacias")
minimoElemento (x:[]) = x
minimoElemento (x:y:xs) | x<y = minimoElemento (x:xs)
                        | otherwise = minimoElemento (y:xs)

--Apartado b)
minimoElemento'::(Ord a, Bounded a) => [a]->a
minimoElemento' [] = maxBound
minimoElemento' (x:[]) = x
minimoElemento' (x:y:xs) | x<y = minimoElemento' (x:xs)
                        | otherwise = minimoElemento' (y:xs)

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
data Deportista = Ajedrecista --Constructor sin argumentos
                 | Ciclista Modalidad --Constructor con un argumento
                 | Velocista Altura --Constructor con un argumento
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

--Apartado d)
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas ((Futbolista Arco n p a):xs) Arco = 1+contar_futbolistas xs Arco
contar_futbolistas ((Futbolista Defensa n p a):xs) Defensa = 1+contar_futbolistas xs Defensa
contar_futbolistas ((Futbolista Mediocampo n p a):xs) Mediocampo = 1+contar_futbolistas xs Mediocampo
contar_futbolistas ((Futbolista Delantera n p a):xs) Delantera = 1+contar_futbolistas xs Delantera
contar_futbolistas (_:xs) zn = contar_futbolistas xs zn

--Apartado e)
contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' [] z = 0
contar_futbolistas' xs z = length (filter fbenzona xs)
   where
    fbenzona (Futbolista zn _ _ _)= zn == z
    fbenzona _ = False

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
                
--Apartado e)
instance Eq NotaMusical
  where
    n1==n2 = sonidoCromatico n1 == sonidoCromatico n2

--Apartado f)
instance Ord NotaMusical
  where
    n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2

--Ejercicio 6
--Apartado a)
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento xs = Just(head xs) 

--Ejercicio 7
data Cola = VaciaC | Encolada Deportista Cola 
             deriving (Show)
--Apartado a)
--1
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ c) = Just c 

--2
encolar :: Deportista -> Cola -> Cola
encolar dp VaciaC = Encolada dp VaciaC
encolar dp (Encolada d y) = Encolada d (encolar dp y)

--3
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _ = Nothing
busca (Encolada (Futbolista z n p a) c) zn   | z==zn = Just (Futbolista z n p a)    
                                             | otherwise = busca c zn
busca (Encolada dp c) zn = busca c zn  

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

--2 
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat Vacia Vacia = Vacia
la_concat Vacia ls1 = ls1
la_concat (Nodo x y ls) ls1 = Nodo x y (la_concat ls ls1)

--3
la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia x y = (Nodo x y Vacia)
la_agregar (Nodo c v la) x y | c==x = (Nodo c y) la
                             | otherwise = Nodo c v (la_agregar la x y)
                             
--4 
la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo x y ls) = (x,y): la_pares ls

--5
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia c = Nothing
la_busca (Nodo x y ls) c | x==c = Just y
                         | otherwise = la_busca ls c

--6
--Borra la primera que encuentra
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar c Vacia = Vacia
la_borrar c (Nodo x y ls) | c == x = ls
                          | otherwise = Nodo x y (la_borrar  c ls)
--Borra todas las que encuentra                
la_borrar' :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar' c Vacia = Vacia
la_borrar' c (Nodo x y ls) | c == x = la_borrar' c ls
                          | otherwise = Nodo x y (la_borrar'  c ls)

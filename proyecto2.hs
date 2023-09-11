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
data Zona = Arco | Defensa | Mediocampo | Delantera deriving (Eq)
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha
--Sinonimo
type ManoHabil = PiernaHabil
--Deportista es un tipo algebraico con constructores parametricos
data Deportista = Ajedrecista --Constructor sin argumentos
                 | Ciclista Modalidad --Constructor con un argumento
                 | Velocista Altura --Constructor con un argumento
                 | Tenista TipoReves ManoHabil Altura --Constructor con tres argumentos
                 | Futbolista Zona NumCamiseta PiernaHabil Altura --Constructor con cuatro argumentos

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
contar_futbolistas ((Futbolista zn n p a):xs) z | (z==zn) = 1 + contar_futbolistas xs z -- Corregir
                                                | otherwise = contar_futbolistas xs z

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
--Apartado a)
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada d c) = Just c 

--Apartado b)
encolar :: Deportista -> Cola -> Cola
encolar dp c = Encolada dp 
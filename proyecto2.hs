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
contar_velocistas ((Velocista a):xs) = 1+ contar_velocistas xs
contar_velocistas (x:xs) = contar_velocistas xs 

--Apartado d)
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] z = 0
contar_futbolistas ((Futbolista zn n p a):xs) z | (z==zn) = 1 + contar_futbolistas xs z 
                                                | otherwise = contar_futbolistas xs z

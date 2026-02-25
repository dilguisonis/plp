
type Incógnita = Integer

data Tipo = X Incógnita
          | C String [Tipo]

instance Show Tipo where
  show (X i)           = "X" ++ show i
  show (C "Bool" [])   = "Bool"
  show (C "->" [s, t]) = "(" ++ show s ++ "->" ++ show t ++ ")"

bool :: Tipo
bool = C "Bool" []

función :: Tipo -> Tipo -> Tipo
función s t = C "->" [s, t]

data Ecuación = Par Tipo Tipo

instance Show Ecuación where
  show (Par s t) = show s ++ " =?= " ++ show t

type Sustitución = Incógnita -> Tipo

sustIdentidad :: Sustitución
sustIdentidad i = X i

sustUnitaria :: Incógnita -> Tipo -> Sustitución
sustUnitaria i t = \ j -> if i == j
                           then t
                           else X j

apSust :: Sustitución -> Tipo -> Tipo
apSust sust (X i)    = sust i
apSust sust (C c ts) = C c (map (apSust sust) ts)

apSustEcuación :: Sustitución -> Ecuación -> Ecuación
apSustEcuación sust (Par s t) = Par (apSust sust s) (apSust sust t)

sustComposición :: Sustitución -> Sustitución -> Sustitución
sustComposición sust1 sust2 = \ i -> apSust sust1 (sust2 i)

ocurre :: Incógnita -> Tipo -> Bool
ocurre i (X j)    = i == j
ocurre i (C _ ts) = any (ocurre i) ts

mgu :: [Ecuación] -> Maybe Sustitución
mgu []               = Just sustIdentidad
mgu (Par (X i) (X j) : es)
  | i == j           = mgu es                         -- Delete
mgu (Par (C c ts) (C c' ts') : es)
  | c == c' && length ts == length ts'
                     = mgu (zipWith Par ts ts' ++ es) -- Decompose
  | otherwise        = Nothing                        -- Clash
mgu (Par t@(C _ _) (X i) : es)
                     = mgu (Par (X i) t : es)         -- Swap
mgu (Par (X i) t : es)
  | ocurre i t       = Nothing                        -- Occurs-Check
  | otherwise        =
       let s = sustUnitaria i t in                    -- Elim
         case mgu (map (apSustEcuación s) es) of
           Nothing -> Nothing
           Just s' -> Just (sustComposición s' s)

test = [
         Par (función (X 1) (función bool (X 2)))
             (función (X 2) (X 1))
       ]

test' = case mgu test of
          Nothing -> "falla"
          Just s  -> "{X1:=" ++ show (s 1) ++ ", X2:=" ++ show (s 2) ++ "}"


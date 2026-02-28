# Resumenes de Teoricas

## Clase 00 -- Introduccion a Paradigmas
- Presenta la materia PLP (Paradigmas de Lenguajes de Programacion) de la UBA. Se recorren tres ejes: programacion, semantica e implementacion de lenguajes.
- Cronograma: programacion funcional (2 sem.), razonamiento ecuacional (1 sem.), logica proposicional (1 sem.), calculo-lambda (2 sem.), inferencia de tipos (1 sem.), unificacion y logica de primer orden (1 sem.), resolucion (1 sem.), programacion logica (1.5 sem.), POO (1 sem.).
- Caracteristicas de lenguajes tratadas: tipado estatico vs. dinamico, funciones de orden superior, inmutabilidad, evaluacion estricta vs. diferida, pattern matching, polimorfismo parametrico, herencia, inferencia de tipos.
- Se introduce Haskell con tipos basicos (Int, Float, Bool, Char, String), listas, tuplas y el tipo Maybe a para funciones totales.
- Tipos de datos inductivos: data AB a = Nil | Bin (AB a) a (AB a). Recorridos: preorder, inorder, postorder.
- Tipos abstractos de datos: Conjunto (sobre listas sin repetidos) y Diccionario (sobre arboles binarios de busqueda) con sus invariantes de representacion.
- Enumeraciones combinatorias: funciones subsecuencias y permutaciones sobre listas.
- Motivacion de la semantica: probar teoremas sobre programas; triplas de Hoare (AED) y otras semanticas (PLP).
- Implementacion: interpretacion (evaluacion) y compilacion (traduccion). Chequeo e inferencia de tipos.

## Clase 01 -- Programacion Funcional
- Un programa funcional es un conjunto de ecuaciones orientadas. Las funciones son puras: sin efectos secundarios, a misma entrada misma salida, datos inmutables.
- Las funciones son datos de primera clase: se pueden pasar como parametros, devolver como resultados y almacenar en estructuras.
- Expresiones fundamentales: constructores (True, False, [], (:), 0, 1...), variables (longitud, x, (+)...) y aplicacion (asociativa a izquierda).
- Tipos: especifican invariantes de datos y funciones. El operador -> es asociativo a derecha. Polimorfismo parametrico: variables de tipo a, b, c. Ejemplo: flip :: (a -> b -> c) -> b -> a -> c.
- Modelo de computo: evaluacion por reescritura del termino mas externo (evaluacion no estricta/lazy). Permite trabajar con listas infinitas (desde n = n : desde (n+1)).
- Pattern matching: el lado izquierdo de una ecuacion es una funcion aplicada a patrones (variables, comodines, constructores). Sin variables repetidas.
- Funciones de orden superior clave: map :: (a -> b) -> [a] -> [b] y filter :: (a -> Bool) -> [a] -> [a], que abstraen esquemas recursivos comunes.
- Notacion lambda: \x -> e. Composicion de funciones: (g . f) x = g (f x). Currificacion y uncurrificacion: curry :: ((a,b) -> c) -> a -> b -> c.
- Esquemas de recursion basicos: operatoria (reduce una lista con operacion binaria) y mientras (itera aplicando una transformacion bajo condicion).
- Arboles binarios infinitos: tipo ABI a = IBin (ABI a) a (ABI a); representacion alternativa como funciones de caminos (Camino -> a).

## Clase 02 -- Recursion y Esquemas
- Recursion estructural sobre listas: g [] = z; g (x:xs) = ... x ... (g xs) .... No se puede usar xs ni g directamente excepto en (g xs).
- foldr :: (a -> b -> b) -> b -> [a] -> b abstrae la recursion estructural. Ejemplos: suma = foldr (+) 0, producto = foldr (*) 1, reverso = foldr (\x rec -> rec ++ [x]) [].
- Propiedades de foldr: foldr (:) [] = id; foldr ((:) . f) [] = map f; foldr (const (+1)) 0 = length.
- Recursion primitiva: similar a la estructural pero permite acceder a xs ademas de (g xs). Se abstrae con recr :: (a -> [a] -> b -> b) -> b -> [a] -> b. Ejemplo: trim (borrar espacios iniciales).
- Recursion iterativa: g ac [] = ac; g ac (x:xs) = g (f ac x) xs. Se abstrae con foldl :: (b -> a -> b) -> b -> [a] -> b. Equivale a un bucle while imperativo. Ejemplo: bin2dec = foldl (\ac b -> b + 2*ac) 0.
- Relacion foldr/foldl: si la operacion es asociativa y conmutativa, definen la misma funcion. foldl (flip (:)) [] = reverse.
- Tipos de datos algebraicos: enumerados (data Dia = Dom | Lun | ...), productos (data Persona = LaPersona String String Int), recursivos (data Nat = Zero | Succ Nat, data AB a = Nil | Bin (AB a) a (AB a)).
- La recursion estructural se generaliza a cualquier tipo algebraico. Para arboles binarios: foldAB :: b -> (b -> a -> b -> b) -> AB a -> b.
- Casos de estudio: cuentas corrientes bancarias como tipo inductivo; insercion en ABB; definiciones de mapAB, maximo, altura usando foldAB.
- Relaciones entre esquemas: foldr se define con recr (trivial); recr se define con foldr (devolviendo tupla con copia de la lista); foldl se define con foldr y viceversa.

## Clase 03 -- Razonamiento Ecuacional
- Objetivo: demostrar formalmente propiedades de programas funcionales. Hipotesis de trabajo: estructuras finitas (tipos inductivos), funciones totales, ecuaciones independientes del orden.
- Principio de reemplazo: si el programa declara e1 = e2, se puede reemplazar cualquier instancia de e1 por e2 y viceversa. Igualdades que se prueban solo asi valen "por definicion".
- Principio de induccion estructural: para probar P sobre todo valor de un tipo inductivo T, basta probar P para cada constructor base y para cada constructor recursivo asumiendo la HI sobre los parametros de tipo T.
- Casos particulares: induccion sobre Bool (probar P(True) y P(False)), pares (probar para todo (x,y)), Nat (P(Zero) y P(n) => P(Suc n)), listas (P([]) y P(xs) => P(x:xs)), arboles binarios (P(Nil) y P(i) ^ P(d) => P(Bin i r d)).
- Principio de extensionalidad funcional: para probar f = g :: a -> b, basta probar que para todo x :: a vale f x = g x.
- Ejemplo clasico: map f (xs ++ ys) = map f xs ++ map f ys, demostrado por induccion sobre xs.
- Isomorfismos de tipos: A ~= B si existen f :: A -> B y g :: B -> A totales con g . f = id y f . g = id. Ejemplo: currificacion demuestra (a,b) -> c ~= a -> b -> c.
- Correccion del razonamiento: si demostramos e1 = e2 :: A, entonces para toda observacion obs :: A -> Bool, obs e1 = True sii obs e2 = True.
- Tecnicas auxiliares: lemas auxiliares (ej: ceros (xs ++ ys) = ceros xs ++ ceros ys) y generalizacion del predicado inductivo (fortalecer P a Q para que la HI sea suficiente).
- Demostracion de desigualdades: para probar e1 /= e2, basta encontrar una observacion obs :: A -> Bool que las distinga.

## Clase 04 -- Sistemas Deductivos
- Un sistema deductivo razona sobre juicios mediante reglas de inferencia (premisas/conclusion). Las reglas sin premisas son axiomas. Un juicio es derivable si existe una derivacion (arbol finito de reglas) sin premisas abiertas.
- Formulas de la logica proposicional: tau ::= P | (tau ^ sigma) | (tau => sigma) | (tau v sigma) | bot | -tau. Implicacion asociativa a derecha.
- Deduccion natural: juicios de la forma Gamma |- tau (del contexto Gamma se deduce tau). Para cada conectivo hay reglas de introduccion y eliminacion.
- Reglas clave: ax (axioma), ^i/^e1/^e2 (conjuncion), =>i/=>e (implicacion, modus ponens), vi1/vi2/ve (disyuncion), bot_e (ex falso), -i/-e (negacion).
- NJ (deduccion natural intuicionista) vs. NK (clasica): NK extiende NJ con principios clasicos equivalentes entre si: eliminacion de doble negacion (--e), tercero excluido (LEM: tau v -tau), reduccion al absurdo clasico (PBC).
- Debilitamiento (weakening): si Gamma |- tau es derivable, entonces Gamma, sigma |- tau es derivable. Se prueba por induccion en la derivacion.
- Semantica bivaluada: una valuacion v : P -> {V, F} satisface formulas segun tablas de verdad clasicas. Gamma |= tau si toda valuacion que satisface Gamma satisface tau.
- Teorema de correccion y completitud (para NK): Gamma |- tau es derivable en NK sii Gamma |= tau. La prueba de correccion va por induccion en la derivacion; la de completitud usa un lema principal y LEM.
- Interes de NJ en computacion: las derivaciones en NJ se corresponden con programas (correspondencia de Curry-Howard, vista en clase 06).
- Reglas derivadas: modus tollens (MT) e introduccion de doble negacion se deducen de las reglas basicas de NJ.

## Clase 05 -- Calculo Lambda
- El calculo-lambda es un lenguaje formal basado en dos operaciones: construir funciones (abstraccion lambda x:tau. M) y aplicarlas (M N). Nucleo de lenguajes funcionales y asistentes de demostracion.
- Calculo lambda^b (con booleanos): tipos tau ::= bool | tau -> sigma. Terminos M ::= x | lambda x:tau. M | M N | true | false | if M then N else P.
- Variables libres y ligadas; alfa-equivalencia (renombre de variables ligadas). Aplicacion asociativa a izquierda, abstraccion con menor precedencia.
- Sistema de tipos con reglas: T-VAR, T-ABS (lambda x:tau. M : tau -> sigma si Gamma,x:tau |- M:sigma), T-APP (Gamma |- M N : sigma si Gamma |- M : tau->sigma y Gamma |- N : tau), T-TRUE, T-FALSE, T-IF.
- Unicidad de tipos: si Gamma |- M : tau y Gamma |- M : sigma, entonces tau = sigma. Weakening/Strengthening.
- Semantica operacional small-step: programas = terminos tipables cerrados. Valores: true, false, abstracciones. Reglas: E-IF, E-IFTRUE, E-IFFALSE, E-APP1, E-APP2, E-APPABS.
- Sustitucion M{x := N}: reemplaza ocurrencias libres de x en M por N, evitando captura de variables.
- Propiedades fundamentales: determinismo, preservacion de tipos (subject reduction), progreso, terminacion. Corolario de canonicidad: todo programa tipado termina en un valor.
- Slogan de Milner: "Well typed programs cannot go wrong."
- Extension lambda^bn con naturales: tipo nat, terminos zero, succ(M), pred(M), isZero(M). Valores: zero, succ(V). Formas normales que no son valores = terminos de error (se pierde progreso fuerte).

## Clase 06 -- Calculo Lambda Tipado (Correspondencia Curry-Howard)
- Correspondencia de Curry-Howard: las reglas de tipado del calculo-lambda se corresponden con las reglas de deduccion natural intuicionista (NJ). Formulas <-> Tipos, Demostraciones <-> Terminos.
- T-ABS corresponde a =>i, T-APP corresponde a =>e (modus ponens). Un juicio |- sigma es derivable en NJ sii el tipo sigma esta habitado (existe M con |- M : sigma).
- Corte (cut): una regla de introduccion seguida inmediatamente de una regla de eliminacion. Eliminacion de cortes (cut-elimination) corresponde a reduccion beta: (lambda x:tau. M) V -> M{x := V}.
- Extension con productos (tau x sigma): pares <M,N>, proyecciones fst(M), snd(M). Corresponde a conjuncion (^). Reduccion: fst(<V,W>) -> V, snd(<V,W>) -> W.
- Extension con sumas (tau + sigma): left^sigma(M), right^tau(M), case M {left(x) -> N | right(y) -> P}. Corresponde a disyuncion (v).
- Tipo vacio (bot): sin constructores, eliminador case^tau M {}. Corresponde a falsedad. La negacion se codifica como -sigma = sigma -> bot.
- Tipo unit (top): un unico constructor *. Corresponde a verdad (top).
- Propiedades del calculo extendido: unicidad de tipos, weakening, determinismo, preservacion de tipos, progreso, terminacion.
- Consistencia de NJ: |- bot no es derivable en NJ (se deduce de terminacion + preservacion + ausencia de valores de tipo bot).
- Operador de punto fijo: fix M con regla T-FIX: si Gamma |- M : tau -> tau entonces Gamma |- fix M : tau. Permite recursion y funciones parciales. fix(lambda x:sigma. x) : sigma para todo sigma, por lo que agregar fix a NJ hace la logica inconsistente (|- bot seria derivable).

## Clase 07 -- Inferencia de Tipos
- Problema de inferencia de tipos: dado un termino U sin anotaciones de tipos, determinar si es tipable y hallar el tipo mas general.
- Unificacion: resolver sistemas de ecuaciones entre tipos con incognitas (variables de tipo X1, X2, ...). Una sustitucion S es un unificador de E si S(tau_i) = S(sigma_i) para cada ecuacion.
- Unificador mas general (mgu): sustitucion S tal que cualquier otro unificador S' se obtiene componiendo S con alguna otra sustitucion.
- Algoritmo de Martelli-Montanari: 6 reglas. Delete (X =? X -> E), Decompose (C(tau1,...) =? C(sigma1,...) -> tau1=?sigma1,...), Swap (tau =? X -> X =? tau si tau no es incognita), Elim (X =? tau -> aplicar {X:=tau} si X no ocurre en tau), Clash (C(...) =? C'(...) -> falla si C /= C'), Occurs-Check (X =? tau -> falla si X /= tau y X ocurre en tau).
- Terminacion del algoritmo: se demuestra con la tripla (n1, n2, n3) que decrece lexicograficamente, donde n1 = cant. incognitas, n2 = tamano de E, n3 = cant. ecuaciones tau =? X.
- Algoritmo T de inferencia de tipos (4 pasos): (1) Rectificacion del termino (variables ligadas con nombres unicos), (2) Anotacion con variables de tipo frescas, (3) Generacion de restricciones (ecuaciones), (4) Unificacion de las restricciones.
- Generacion de restricciones: I(Gamma | True) = (Bool | {}), I(Gamma | x) = (Gamma(x) | {}), I(Gamma | M1 M2) = (Xk | {tau1 =? tau2 -> Xk} u E1 u E2), I(Gamma | lambda x:tau. M) = (tau -> sigma | E).
- Teorema de correccion del algoritmo T: si U es tipable, mgu(E) existe y S(Gamma0) |- S(M0) : S(tau) es el juicio de tipado mas general; si U no es tipable, no hay unificador.
- Ejemplo clasico: lambda x. lambda y. y x infiere tipo X1 -> (X1 -> X2) -> X2. El termino (lambda x. x x)(lambda x. x x) no es tipable (occurs-check falla).

## Clase 08 -- Logica de Primer Orden
- Extiende la logica proposicional con terminos (variables, funciones con aridad) y cuantificadores (para todo, existe). Permite razonar sobre elementos de un dominio.
- Lenguaje de primer orden L: conjunto de simbolos de funcion F (con aridades) y simbolos de predicado P (con aridades). Terminos: t ::= X | f(t1,...,tn). Formulas: atomicas P(t1,...,tn), conectivos, cuantificadores.
- Variables libres y ligadas; sustitucion sigma{X := t} evitando captura. Formulas alfa-equivalentes si difieren solo en nombres de variables ligadas.
- Deduccion natural extendida: reglas para-todo-i (Gamma |- sigma, X no libre en Gamma => Gamma |- para-todo X. sigma), para-todo-e (Gamma |- para-todo X. sigma => Gamma |- sigma{X:=t}), existe-i (Gamma |- sigma{X:=t} => Gamma |- existe X. sigma), existe-e (Gamma |- existe X. sigma, Gamma,sigma |- tau, X no libre en Gamma,tau => Gamma |- tau).
- Estructuras de primer orden: M = (M, I) con universo M y funcion de interpretacion I. Asignaciones a : X -> M. Interpretacion de terminos y satisfaccion de formulas: a |=_M sigma.
- Validez (verdadera en toda estructura y asignacion), satisfactibilidad, insatisfactibilidad, invalidez. Sentencias = formulas cerradas. Teorias = conjuntos de sentencias.
- Teorema de Godel (1929): una teoria T es consistente (T no |- bot) sii T tiene al menos un modelo. Corolario: |- sigma derivable sii sigma es valida.
- El problema de la decision para logica de primer orden es indecidible (no existe algoritmo que determine validez de formulas arbitrarias).
- Unificacion de terminos de primer orden: mismo algoritmo de Martelli-Montanari, adaptado cambiando incognitas de tipos por variables logicas.
- Conexion con computacion: bases de datos relacionales, verificacion formal, inteligencia artificial, programacion logica (Prolog).

## Clase 09 -- Resolucion
- Introduce Prolog brevemente: programas = reglas (clausulas de definicion), consultas = clausulas objetivo. Las reglas sigma :- tau1, ..., taun se interpretan como para-todo X1...Xk. ((tau1 ^ ... ^ taun) => sigma).
- Metodo de resolucion proposicional: para probar que sigma es valida, (1) pasar -sigma a forma clausal (conjunto C de clausulas), (2) buscar refutacion C |- bot.
- Pasaje a forma clausal (proposicional): (1) eliminar =>, (2) empujar - hacia adentro (forma normal negada NNF), (3) distribuir v sobre ^ (forma normal conjuntiva CNF). Clausulas = conjuntos de literales; conjunto de clausulas = conjuncion.
- Regla de resolucion proposicional: de {P, l1,...,ln} y {-P, l'1,...,l'm} se obtiene la resolvente {l1,...,ln, l'1,...,l'm}. Si se alcanza la clausula vacia {}, el conjunto es insatisfactible.
- Correccion y completitud: el algoritmo de refutacion proposicional termina y retorna INSAT sii C0 |- bot.
- Resolucion de primer orden: procedimiento de semi-decision (si sigma es valida, termina; si no, puede no terminar).
- Pasaje a forma clausal (primer orden): (1) eliminar =>, (2) NNF (empujar - y mover -para-todo/-existe), (3) forma prenexa (extraer cuantificadores), (4) Skolemizacion (reemplazar existenciales por funciones de Skolem; preserva satisfactibilidad pero no equivalencia), (5) CNF, (6) distribuir para-todo en conjunciones.
- Regla de resolucion de primer orden: usa unificacion (mgu) para hacer coincidir literales complementarios. Se renombran variables para evitar conflictos.
- Resolucion binaria (resolver un literal de cada clausula) no es completa. Se necesita la version general que unifica multiples literales simultaneamente.
- No terminacion: la resolucion de primer orden puede ciclar para formulas no validas. Ejemplo: para-todo X. (P(succ(X)) => P(X)) => P(0) genera clausulas que producen infinitos resolventes.

## Clase 10 -- Programacion Logica (Prolog)
- La clase 10 corresponde al mismo contenido de resolucion (clase 09), con enfasis en la introduccion a Prolog como ejemplo motivador del metodo de resolucion.
- Prolog opera con terminos de primer orden y formulas atomicas. Los programas son conjuntos de reglas (clausulas de Horn), las consultas son clausulas objetivo.
- Las reglas sigma :- tau1, ..., taun se interpretan logicamente como para-todo X1...Xk. (tau1 ^ ... ^ taun => sigma). Las consultas ?- sigma1, ..., sigman como existe X1...Xk. (sigma1 ^ ... ^ sigman).
- El motor de Prolog busca refutar la negacion de la consulta usando resolucion. Si encuentra una refutacion, la consulta tiene exito y se devuelven las sustituciones (bindings) de las variables.
- Forma clausal en logica de primer orden: el pasaje completo incluye eliminacion de =>, NNF, forma prenexa, Skolemizacion, CNF. La Skolemizacion preserva satisfactibilidad pero no equivalencia.
- La regla de resolucion de primer orden extiende la proposicional usando mgu para unificar literales complementarios.
- Correccion: si C0 es insatisfactible, existe una refutacion. Si C0 es satisfactible, el metodo puede no terminar (semi-decision).

## Clase 11 -- Programacion OO (Smalltalk)
- La POO modela entidades como objetos que interactuan mediante mensajes. Un mensaje solicita una operacion; un metodo es la implementacion.
- Principio de encapsulamiento: solo se accede a un objeto via su interfaz. El estado interno (colaboradores internos/atributos) es privado. Permite intercambiar representaciones sin afectar comportamiento observable ("duck typing").
- Clases e instancias: todo objeto es instancia de una clase. La clase define atributos y metodos compartidos por todas sus instancias. Clases abstractas no tienen instancias directas.
- Herencia: las clases forman una jerarquia. Una subclase hereda metodos de su superclase y puede redefinirlos (override). Ejemplo: Number > Integer > SmallInteger, Number > Float.
- Smalltalk: sintaxis de mensajes unarios (obj msg), binarios (obj op arg) y keyword (obj msg1: arg1 msg2: arg2). Precedencia: unarios > binarios > keyword. Seis palabras reservadas: nil, true, false, self, super, thisContext.
- Polimorfismo: una misma operacion puede operar con objetos de distintas clases que implementen la misma interfaz. Ejemplo: coleccion de animales donde cada uno responde "hablar" de manera diferente.
- No hay estructuras de control nativas: if, while, etc. se implementan con mensajes y bloques. Bloques (clausuras): [Cmd] o [:x | Cmd], se evaluan con value/value:.
- Algoritmo de method dispatch: dado un objeto O, selector S y clase C: (1) si C define metodo para S, usarlo; (2) si no, buscar en superclase; (3) si se llega a nil, doesNotUnderstand.
- self: refiere al objeto receptor; la busqueda del metodo empieza en la clase del objeto. super: mismo objeto receptor, pero la busqueda empieza en la superclase de la clase que contiene el envio a super.
- Ejemplo integrador: clase Robot con posicion y desplazar, subclase RobotConUndo que agrega undo reutilizando codigo via super. Streams infinitos con subclases Progresion, Cons, Intercalacion.

## Clase 12 -- Resolucion SLD
- Resolucion SLD: variante de resolucion general restringida a clausulas de Horn. Tradeoff: menor generalidad (solo clausulas de Horn) a cambio de mayor eficiencia.
- Clausulas de Horn: objetivo (0 literales positivos, >= 0 negativos), definicion (1 positivo, >= 0 negativos). La regla SLD resuelve siempre una clausula de definicion con una clausula objetivo.
- Regla SLD: se elige un literal negativo de la clausula objetivo, se unifica con el literal positivo de alguna clausula de definicion; la resolvente es una nueva clausula objetivo. La seleccion es binaria.
- Derivacion SLD: secuencia G1 ->S1 G2 ->S2 ... ->Sn {} donde cada paso aplica la regla SLD. La sustitucion respuesta es Sn o ... o S1.
- Completitud de SLD: si {D1,...,Dn, G} es insatisfactible, existe una refutacion SLD.
- Semantica operacional de Prolog: criterio de seleccion = primer literal de la clausula objetivo; criterio de busqueda = reglas en orden de aparicion (DFS, depth-first search).
- Incompletitud de DFS: el orden de las reglas es relevante. Si la primera regla genera recursion infinita, Prolog no encuentra soluciones que existirian con otro orden. BFS seria completa pero muy costosa.
- Prolog omite occurs-check por eficiencia: puede producir refutaciones incorrectas (ej: unificar X con f(X)). La carga de correccion recae en el programador.
- Operador de corte (!): predicado extra-logico que poda el arbol de busqueda. Al alcanzarlo, descarta alternativas para la regla actual. Green cuts (no alteran semantica, optimizan) vs. red cuts (alteran semantica).
- Negacion por falla: not(P) :- P, !, fail. not(P). Tiene exito sii P falla. No coincide con la negacion logica; el orden de literales se vuelve relevante, atentando contra la declaratividad.

# Practica N° 7 - Resolucion en Logica

**Paradigmas de Programacion (PLP) - 2do Cuatrimestre de 2025**

---

## Resolucion en Logica Proposicional

### Ejercicio 1 ★

Convertir a Forma Normal Conjuntiva y luego a Forma Clausal (notacion de conjuntos) las siguientes formulas proposicionales:

I. P ⇒ P

II. (P ∧ Q) ⇒ P

III. (P ∨ Q) ⇒ P

IV. ¬(P ⇔ ¬P)

V. ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)

VI. (P ∧ Q) ∨ (P ∧ R)

VII. (P ∧ Q) ⇒ R

VIII. P ⇒ (Q ⇒ R)

### Ejercicio 2 ★

I. ¿Cuales de las formulas del ejercicio anterior son tautologias? Demostrarlas utilizando el metodo de resolucion para la logica proposicional. Para las demas, indicar que pasa si se intenta demostrarlas usando este metodo.

II. ¿Se deduce (P ∧ Q) de (¬P ⇒ Q) ∧ (P ⇒ Q) ∧ (¬P ⇒ ¬Q)? Contestar utilizando el metodo de resolucion para la logica proposicional.

### Ejercicio 3

Demostrar las siguientes tautologias utilizando el metodo de resolucion para la logica proposicional. Notar que no siempre es necesario usar todas las clausulas.

- (P ⇒ (P ⇒ Q)) ⇒ (P ⇒ Q)
- (R ⇒ ¬Q) ⇒ ((R ∧ Q) ⇒ P)
- ((P ⇒ Q) ⇒ (R ⇒ ¬Q)) ⇒ ¬(R ∧ Q)

### Ejercicio 4 ★

Un grupo de amigos queria juntarse a comer en una casa, pero no decidian en cual. Prevalecian dos propuestas: la casa de Fabiana, que era comoda y espaciosa, y la de Manuel, mas chica pero con un amplio jardin y parrilla al aire libre. Finalmente acordaron basar su eleccion en el pronostico del tiempo. Si anunciaban lluvia, se reunirian en la casa de Fabiana; y si no, en la de Manuel (desde ya, la reunion tendria lugar en una sola casa).

Finalmente llego el dia de la reunion, y el grupo se junto a comer en la casa de Fabiana, pero no llovio.

Utilizar las siguientes proposiciones para demostrar - mediante el metodo de resolucion - que el pronostico se equivoco (anuncio lluvia y no llovio, o viceversa).

- P = "El pronostico anuncio lluvia."
- F = "El grupo se reune en la casa de Fabiana."
- M = "El grupo se reune en la casa de Manuel."
- L = "Llueve en el dia de la reunion."

**Ayuda:** por la descripcion de arriba sabemos que P ⇒ F, ¬P ⇒ M y ¬(F ∧ M), ademas de que F y ¬L son verdaderas. Pensar en lo que se quiere demostrar para decidir que pares de clausulas utilizar.

---

## Resolucion en Logica de Primer Orden

En esta seccion, salvo que se haga referencia a SLD, la palabra *resolucion* denota el metodo de resolucion general. Siempre que se demuestre una propiedad, se debera indicar la sustitucion utilizada en cada paso de resolucion.

### Ejercicio 5

Convertir a Forma Normal Negada (NNF) las siguientes formulas de primer orden:

I. ∀X.∀Y.(¬Q(X,Y) ⇒ ¬P(X,Y))

II. ∀X.∀Y.((P(X,Y) ∧ Q(X,Y)) ⇒ R(X,Y))

III. ∀X.∃Y.(P(X,Y) ⇒ Q(X,Y))

### Ejercicio 6 ★

Convertir a Forma Normal de Skolem y luego a Forma Clausal las siguientes formulas de primer orden:

I. ∃X.∃Y.X < Y, siendo < un predicado binario usado de forma infija.

II. ∀X.∃Y.X < Y

III. ∀X.¬(P(X) ∧ ∀Y.(¬P(Y) ∨ Q(Y)))

IV. ∃X.∀Y.(P(X,Y) ∧ Q(X) ∧ ¬R(Y))

V. ∀X.(P(X) ∧ ∃Y.(Q(Y) ∨ ∀Z.∃W.(P(Z) ∧ ¬Q(W))))

### Ejercicio 7

Para pensar (o jugar):

I. Exhibir una clausula que arroje un resolvente consigo misma.

II. Exhibir dos clausulas, cada una con no mas de dos literales, que arrojen tres o mas resolventes distintos entre si.

III. Exhibir dos clausulas que arrojen como resolvente □ si se unifican tres o mas terminos a la vez, pero no si se unifica solamente un termino de cada lado.

### Ejercicio 8 ★

La computadora de la policia registro que el Sr. Smullyan no pago una multa. Cuando el Sr. Smullyan pago la multa, la computadora grabo este hecho pero, como el programa tenia errores, no borro el hecho que expresaba que no habia pagado la multa. A partir de la informacion almacenada en la computadora, mostrar utilizando resolucion que el jefe de gobierno es un espia.

Utilizar los siguientes predicados y constantes: *Pago(X)* para expresar que X pago su multa, *Espia(X)* para X es un espia, smullyan para el Sr. Smullyan y jefeGob para el jefe de gobierno.

### Ejercicio 9 ★

¿Cuales de las siguientes formulas son logicamente validas? Demostrar las que lo sean usando resolucion.

I. [∃X.∀Y.R(X,Y)] ⇒ ∀Y.∃X.R(X,Y)

II. [∀X.∃Y.R(X,Y)] ⇒ ∃Y.∀X.R(X,Y)

III. ∃X.[P(X) ⇒ ∀X.P(X)]

IV. ∃X.[P(X) ∨ Q(X)] ⇒ [∃X.P(X) ∨ ∃X.Q(X)]

V. ∀X.[P(X) ∨ Q(X)] ⇒ [∀X.P(X) ∨ ∀X.Q(X)]

VI. [∃X.P(X) ∧ ∀X.Q(X)] ⇒ ∃X.[P(X) ∧ Q(X)]

VII. ∀X.∃Y.∀Z.∃W.[P(X,Y) ∨ ¬P(W,Z)]

VIII. ∀X.∀Y.∀Z.([¬P(f(a)) ∨ ¬P(Y) ∨ Q(Y)] ∧ P(f(Z)) ∧ [¬P(f(f(X))) ∨ ¬Q(f(X))])

### Ejercicio 10 *(Aplicaciones del metodo de resolucion)*

I. Expresar en forma clausal la regla del *modus ponens* y mostrar que es valida, usando resolucion.

II. Lo mismo para la regla del *modus tollens*.

III. Lo mismo para la regla de especializacion: de ∀XP(X) concluir P(t) cualquiera sea el termino t.

### Ejercicio 11 ★

Dadas las siguientes clausulas:

- {P(X), ¬P(X), Q(a)}
- {P(X), ¬Q(Y), ¬R(X,Y)}
- {¬P(X,X,Z), ¬Q(X,Y), ¬Q(Y,Z)}
- {M(1,2,X)}

I. ¿Cuales son clausulas de Horn?

II. Para cada clausula de Horn indicar si es una clausula de definicion (hecho o regla) o una clausula objetivo.

III. Dar, para cada clausula, la formula de primer orden que le corresponde.

### Ejercicio 12 ★

Indicar cuales de las siguientes condiciones son necesarias para que una demostracion por resolucion sea SLD.

- Realizarse de manera lineal (utilizando en cada paso el resolvente obtenido en el paso anterior).
- Utilizar unicamente clausulas de Horn.
- Utilizar cada clausula a lo sumo una vez.
- Empezar por una clausula objetivo (sin literales positivos).
- Empezar por una clausula que provenga de la negacion de lo que se quiere demostrar.
- Recorrer el espacio de busqueda de arriba hacia abajo y de izquierda a derecha.
- Utilizar la regla de resolucion binaria en lugar de la general.

### Ejercicio 13 ★

Alan es un robot japones. Cualquier robot que puede resolver un problema logico es inteligente. Todos los robots japoneses pueden resolver todos los problemas de esta practica. Todos los problemas de esta practica son logicos. Existe al menos un problema en esta practica. ¿Quien es inteligente? Encontrarlo utilizando resolucion SLD y composicion de sustituciones.

Utilizar los siguientes predicados y constantes: R(X) para expresar que X es un robot, Res(X,Y) para X puede resolver Y, PL(X) para X es un problema logico, Pr(X) para X es un problema de esta practica, I(X) para X es inteligente, J(X) para X es japones y la constante alan para Alan.

### Ejercicio 14 ★

Sean las siguientes clausulas (en forma clausal), donde *suma* y *par* son predicados, *suc* es una funcion y *cero* una constante:

```
1. {¬suma(X,Y,Z), suma(X,suc(Y),suc(Z))}
2. {suma(X,cero,X)}
3. {¬suma(X,X,Y), par(Y)}
```

Demostrar utilizando resolucion que suponiendo (1), (2), (3) se puede probar *par(suc(suc(cero)))*. Si es posible, aplicar resolucion SLD. En caso contrario, utilizar resolucion general. Mostrar en cada aplicacion de la regla de resolucion la sustitucion utilizada.

### Ejercicio 15

I. Pasar las siguientes formulas en logica de primer orden a forma clausal.

   a) ∀C.(V(C) ∨ ∃E.P(E,C))

   b) ¬∃C.(V(C) ∧ ∃E.P(E,C))

   c) ∀E.∀C.(P(E,i(C)) ⇔ P(E,C))

II. A partir de las clausulas definidas en el punto anterior, ¿puede demostrarse ∀C.(V(i(C)) ⇒ V(C)) usando resolucion SLD? Si se puede, hacerlo. Si no, demostrarlo usando el metodo de resolucion general.

### Ejercicio 16 ★

Un logico estaba sentado en un bar cuando se le ocurrio usar el metodo de resolucion para demostrar el teorema del bebedor: siempre que haya alguien en el bar, habra alli alguien tal que, si esta bebiendo, todos en el bar estan bebiendo. Sin embargo, el logico en cuestion habia bebido demasiado y la prueba no le salio muy bien.

Esto fue lo que escribio en la servilleta del bar:

```
Teorema del bebedor:    (∃X.enBar(X)) ⇒ ∃Y.(enBar(Y) ∧ (bebe(Y) ⇒ ∀Z.(enBar(Z) ⇒ bebe(Z))))
Elimino implicaciones:  (¬∃X.enBar(X)) ∨ ∃Y.(enBar(Y) ∧ (¬bebe(Y) ∨ ∀Z.(¬enBar(Z) ∨ bebe(Z))))
Skolemizo:              (¬enBar(c)) ∨ (enBar(k) ∧ (¬bebe(k) ∨ ∀Z.(¬enBar(Z) ∨ bebe(Z))))
Paso a Forma Clausal:   1. {¬enBar(c)}  2. {enBar(k)}  3. {¬bebe(k)}  4. {¬enBar(Z), bebe(Z)}
```

Aplico resolucion:

```
De 3 y 4 con σ = {k ← Z}:
5. {¬enBar(Z)}
De 5 y 1 con σ = {Z ← c}:
□
```

a) Identificar los 5 errores cometidos en la demostracion. (La formula original es correcta, notar que salteo pasos importantes e hizo mal otros).

b) Demostrar el teorema de manera correcta, usando resolucion.

c) Indicar si la resolucion utilizada en el punto b es o no SLD. Justificar.

### Ejercicio 17

Dadas las siguientes afirmaciones:

- Toda persona tiene un contacto en Facebook:
  ∀X.∃Y.esContacto(X,Y)
  **1.** {esContacto(X,f(X))}

- La relacion entre contactos es simetrica:
  ∀X.∀Y.(esContacto(X,Y) ⇒ esContacto(Y,X))
  **2.** {¬esContacto(X,Y), esContacto(Y,X)}

I. La siguiente es una demostracion de que toda persona es contacto de si misma, es decir, de que ∀X esContacto(X,X).

   - Negando la conclusion:
     ¬∀X.esContacto(X,X)
   - Forma normal negada:
     ∃X.¬esContacto(X,X)
   - Skolemizando y en forma clausal:
     **3.** {¬esContacto(c,c)}
   - De 1 y 3, con σ = {X := c, f(X) := c}:
     □

   ¿Es correcta? Si no lo es, indicar el o los errores.

II. ¿Puede deducirse de las dos premisas que toda persona es contacto de alguien (es decir, de que ∀Y.∃X.esContacto(X,Y))? En caso afirmativo dar una demostracion, y en caso contrario explicar por que.

### Ejercicio 18 ★

Dadas las siguientes definiciones de Descendiente y Abuelo a partir de la relacion Progenitor:

```
{¬Progenitor(X,Y), Descendiente(Y,X)}        {¬Descendiente(X,Y), ¬Descendiente(Y,Z), Descendiente(X,Z)}
{¬Abuelo(X,Y), Progenitor(X,medio(X,Y))}     {¬Abuelo(X,Y), Progenitor(medio(X,Y),Y)}
```

Demostrar usando resolucion general que los nietos son descendientes; es decir, que

∀X.∀Y.(Abuelo(X,Y) ⇒ Descendiente(Y,X))

**Ayuda:** tratar de aplicar el metodo a ciegas puede traer problemas. Conviene tener en mente lo que se quiere demostrar.

### Ejercicio 19 ★

En este ejercicio usaremos el metodo de resolucion para demostrar una propiedad de las relaciones binarias; a saber, que una relacion no vacia no puede ser a la vez irreflexiva, simetrica y transitiva.

Para esto se demostrara la propiedad deseada para una relacion arbitraria R.

Dadas las siguientes definiciones:

1. R es **irreflexiva**: ∀X.¬R(X,X)
2. R es **simetrica**: ∀X.∀Y.(R(X,Y) ⇒ R(Y,X))
3. R es **transitiva**: ∀X.∀Y.∀Z.((R(X,Y) ∧ R(Y,Z)) ⇒ R(X,Z))
4. R es **vacia**: ∀X.¬∃Y.R(X,Y)

Utilizando resolucion, demostrar que si R cumple las propiedades 1 a 3, entonces es vacia. Indicar si el metodo de resolucion utilizado es o no SLD (Y justificar).

### Ejercicio 20 ★

Considerar las siguientes definiciones en Prolog:

```prolog
natural(cero).                  mayorOIgual(suc(X),Y) :- mayorOIgual(X, Y).
natural(suc(X)) :- natural(X).  mayorOIgual(X,X) :- natural(X).
```

- ¿Que sucede al realizar la consulta `?- mayorOIgual(suc(suc(N)), suc(cero))`?
- Utilizar el metodo de resolucion para probar la validez de la consulta del item 1. Para ello, convertir las clausulas a forma clausal.
- Indicar si el metodo de resolucion utilizado es o no SLD, y justificar. En caso de ser SLD, ¿respeta el orden en que Prolog hubiera resuelto la consulta?

### Ejercicio 21

Dado el siguiente programa en Prolog, pasarlo a forma clausal y demostrar utilizando resolucion que hay alguien que es inteligente pero analfabeto.

```prolog
analfabeto(X) :- vivo(X), noSabeLeer(X).    noSabeLeer(X) :- mesa(X).
vivo(X) :- delfin(X).                        noSabeLeer(X) :- delfin(X).
inteligente(flipper).                         delfin(flipper).
inteligente(alan).
```

### Ejercicio 22

Considerar las siguientes definiciones en prolog:

```prolog
preorder(nil,[]).                          append([],YS,YS).
preorder(bin(I,R,D),[R|L]) :- append(LI,LD,L),
                               preorder(I,LI), preorder(D,LD).
                                           append([X|XS],YS,[X|L]) :- append(XS,YS,L).
```

- ¿Que sucede al realizar la consulta `?- preorder(bin(bin(nil,2,nil),1,nil),Lista).`?
- Utilizar el metodo de resolucion para encontrar la solucion al problema.
- Indicar si el metodo de resolucion utilizado es o no SLD, y justificar. En caso de ser SLD, ¿respeta el orden en que Prolog hubiera resuelto la consulta?

### Ejercicio 23

Dada la siguiente base de conocimientos en Prolog:

```prolog
parPositivo(X,Y) :- mayor(X, 0), mayor(Y, 0).

natural(0).                          mayor(succ(X),0) :- natural(X).
natural(succ(N)) :- natural(N).      mayor(succ(X),succ(Y)) :- mayor(X,Y).
```

a) Explicar con palabras que sucede al realizar la siguiente consulta:

```prolog
parPositivo(A,B), mayor(A,B).
```

b) Expresar la base de conocimientos y la consulta anterior como formulas logicas, y luego encontrar una solucion a la consulta utilizando resolucion SLD.

### Ejercicio 24

Sea la siguiente base de conocimientos en Prolog, que describe una parte de las reglas de reduccion de un cierto lenguaje:

```prolog
reduce(const * X * _, X).
reduce(id * X, X).
reduce(flip * F * X * Y, F * Y * X).
reduce(M * N, M1 * N) :- reduce(M, M1).
```

Donde el operador `*` representa la aplicacion. Este operador asocia a izquierda. Si les resulta mas comodo, pueden reescribir las expresiones de la forma A * B como ap(A, B).

Se realiza la siguiente consulta:

```prolog
? reduce(flip * const * X * Y, A), reduce(A, Z), reduce(const * id * X * Y, B), reduce(B,Z).
```

a) Reescribir la base de conocimientos y la consulta como formulas logicas.

b) Resolver la consulta utilizando el metodo de resolucion para obtener los valores de A y B.

c) La resolucion utilizada en el punto anterior, ¿fue SLD? Justificar. En caso afirmativo, ¿fue la misma resolucion que habria utilizado Prolog?

### Ejercicio 25

El siguiente es un programa escrito en Prolog que define los numeros naturales, su relacion de orden estricto, y un intento fallido de generar todos los pares de naturales.

```prolog
natural(0).                         mayor(suc(X),X).
natural(suc(X)) :- natural(X).     mayor(suc(X),Y) :- mayor(X,Y).

parDeNat(X,Y) :- natural(X), natural(Y).
```

Puede observarse que el programa no funciona correctamente, ya que, por ejemplo, la siguiente consulta se cuelga en lugar de arrojar una solucion:

```prolog
?- parDeNat(X,Y), mayor(X,Y).
```

Sin embargo, las definiciones son logicamente correctas. Veamoslo usando resolucion.

a) Convertir la base de conocimientos a forma clausal.

b) Utilizar el metodo de resolucion para hallar una solucion a la consulta.

c) La resolucion realizada en el punto anterior ¿fue SLD? Justificar. En caso afirmativo, ¿en que difiere de lo que habria hecho Prolog? En caso contrario, ¿seria posible encontrar una solucion mediante resolucion SLD? (No es necesario escribirla, solo justificar por que es o no es posible.)

### Ejercicio 26

a) Representar en forma clausal las siguientes formulas de logica de primer orden referidas a numeros enteros.

   I. ∀X.(par(X) ⇒ ∃Y.(Y > X ∧ ¬par(Y))) - Para todo X par existe un impar mayor que el.

   II. ∀X.(¬par(X) ⇒ ∃Y.(Y > X ∧ par(Y))) - Para todo X impar existe un par mayor que el.

   III. ∀X.∀Y.∀Z.((X > Y ∧ Y > Z) ⇒ X > Z) - La relacion de mayor es transitiva.

b) Usando resolucion demostrar que para todo par existe otro par mayor, es decir,
   ∀X.(par(X) ⇒ ∃Y.(Y > X ∧ par(Y))).

c) Indicar si la demostracion es SLD y justificar.

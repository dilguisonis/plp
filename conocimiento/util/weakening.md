# Demostración (parcial) de Weakening para Deducción Natural

Queremos demostrar la siguiente propiedad:

Si $\Gamma \vdash \sigma$ es válido entonces $\Gamma , \tau \vdash \sigma$ es válido.

Dado que la propiedad es una implicación y que, por propiedad de Bool, si el antecedente es falso la implicación es verdadera, suponemos que el antecedente es verdadero  es decir, que vale $\Gamma \vdash \sigma \mathrm { ~ - ~ y ~ }$ demostramos que el consecuente también lo es.

Esto se puede probar mediante inducción estructural en la derivación de $\Gamma \vdash \sigma$ (es decir, en su demostración por deduciión natural).

De esta manera, tenemos un caso por cada regla de nuestro sistema deductivo, siendo el caso base la única regla que no tiene premisas.

Vamos a desarrollar solamente algunos casos. El resto queda para que los desarrollen ustedes.

# Caso base (ax):

La demostración de $\Gamma \vdash \sigma$ es de la forma:

$$
\overline { { \Gamma ^ { \prime } , \sigma \vdash \sigma } }
$$

En este caso $\Gamma$ es $\Gamma ^ { \prime } , \sigma$ , y $\sigma$ es una fórmula cualquiera.

La demostración de $\Gamma , \tau \vdash \sigma$ puede construirse de la siguiente manera:

$$
\overline { { \Gamma ^ { \prime } , \sigma , \tau \vdash \sigma } }
$$

Como $\Gamma ^ { \prime } , \sigma = \Gamma$ , con esto queda probado este caso.

# Caso inductivo $( \Rightarrow _ { i } )$ :

La demostración de $\Gamma \vdash \sigma$ es de la forma:

$$
{ \frac { \Gamma , \sigma _ { 1 } \vdash \sigma _ { 2 } } { \Gamma \vdash \sigma _ { 1 } \Rightarrow \sigma _ { 2 } } } \Rightarrow _ { i }
$$

En este caso $\Gamma$ es un contexto cualquiera y $\sigma$ es $\sigma _ { 1 } \Rightarrow \sigma _ { 2 }$ .

La hipótesis inductiva es que la propiedad vale para la premisa, que es el subárbol de la demostración. Es decir, que $\Gamma , \sigma _ { 1 } , \tau \vdash \sigma _ { 2 }$ es válido. Por completitud, esto signica que existe una demostración en deducción natural para $\Gamma , \sigma _ { 1 } , \tau \vdash \sigma _ { 2 }$ .

La demostración de $\Gamma , \tau \vdash \sigma$ puede construirse de la siguiente manera:

$$
\frac { \overline { { \Gamma , \sigma _ { 1 } , \tau \vdash \sigma _ { 2 } } } ^ { H I } } { \Gamma , \tau \vdash \sigma _ { 1 } \Rightarrow \sigma _ { 2 } } \Rightarrow _ { i }
$$

Con esto queda probado este caso.

# Caso inductivo $( \Rightarrow e$ ):

La demostración de $\Gamma \vdash \sigma$ es de la forma:

$$
\frac { \Gamma \vdash \rho \Rightarrow \sigma \quad \Gamma \vdash \rho } { \Gamma \vdash \sigma } \Rightarrow _ { e }
$$

En este caso $\Gamma$ es un contexto cualquiera y $\sigma$ es una fórmula cualquiera.

La hipótesis inductiva es que la propiedad vale para las premisas, es decir que $\Gamma , \tau \vdash \rho \Rightarrow \sigma$ y $\Gamma , \tau \vdash \rho$ son válidos (y por ende demostrables, por completitud).

La demostración de $\Gamma , \tau \vdash \sigma$ puede construirse de la siguiente manera:

$$
\frac { \overline { { \Gamma , \tau \vdash \rho \Rightarrow \sigma } } ^ { H I } \quad \overline { { \Gamma , \tau \vdash \rho } } ^ { H I } } { \Gamma , \tau \vdash \sigma } \Rightarrow _ { i }
$$

Con esto queda probado este caso.

Los otros casos son similares. Cada caso inductivo tiene una hipótesis inductiva para cada premisa. Prueben completarlos y, ante cualquier duda, consulten.
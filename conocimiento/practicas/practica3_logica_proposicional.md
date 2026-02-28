# Práctica N° 3 - Demostración en Lógica Proposicional

**Paradigmas de Programación (PLP)**
2do Cuatrimestre de 2025

---

Los ejercicios marcados con el símbolo ★ constituyen un subconjunto mínimo de ejercitación. Sin embargo, aconsejamos fuertemente hacer todos los ejercicios.

---

## Semántica

### Ejercicio 1

Determinar el valor de verdad de las siguientes proposiciones (fórmulas):

i. (¬P ∨ Q)
ii. (P ∨ (S ∧ T) ∨ Q)
iii. ¬(Q ∨ S)
iv. (¬P ∨ S) ⇔ (¬P ∧ ¬S)
v. ((P ∨ S) ∧ (T ∨ Q))
vi. (((P ∨ S) ∧ (T ∨ Q)) ⇔ (P ∨ (S ∧ T) ∨ Q))
vii. (¬Q ∧ ¬S)

cuando el valor de verdad de P y Q es V, mientras que el de S y T es F.

### Ejercicio 2

Mostrar que cualquier fórmula de la lógica proposicional que utilice los conectivos ¬ (negación), ∧ (conjunción), ∨ (disyunción), ⇒ (implicación) puede reescribirse a otra fórmula equivalente que usa sólo los conectivos ¬ y ∨. **Sugerencia:** hacer inducción en la estructura de la fórmula.

### Ejercicio 3

Sean τ, σ, ρ y ζ proposiciones tales que τ ⇒ σ es tautología y ρ ⇒ ζ es contradicción. Determinar si las siguientes proposiciones son tautologías, contradicciones o contingencias y demostrarlo:

i. (τ ⇒ σ) ∨ (ρ ⇒ ζ)
ii. (τ ⇒ ρ) ∨ (σ ⇒ ζ)
iii. (ρ ⇒ σ) ∨ (ζ ⇒ σ)

### Ejercicio 4

Probar que cualquier fórmula que sea una tautología contiene un ¬ o una ⇒.

---

## Deducción natural

### Ejercicio 5 ★

Demostrar en deducción natural que las siguientes fórmulas son teoremas **sin usar principios de razonamiento clásicos** salvo que se indique lo contrario. Recordemos que una fórmula σ es un teorema si y sólo si vale ⊢ σ:

i. *Modus ponens* relativizado:
   (ρ ⇒ σ ⇒ τ) ⇒ (ρ ⇒ σ) ⇒ ρ ⇒ τ

ii. Reducción al absurdo: (ρ ⇒ ⊥) ⇒ ¬ρ

iii. Introducción de la doble negación: ρ ⇒ ¬¬ρ

iv. Eliminación de la triple negación: ¬¬¬ρ ⇒ ¬ρ

v. Contraposición: (ρ ⇒ σ) ⇒ (¬σ ⇒ ¬ρ)

vi. Adjunción: ((ρ ∧ σ) ⇒ τ) ⇔ (ρ ⇒ σ ⇒ τ)

vii. de Morgan (I): ¬(ρ ∨ σ) ⇔ (¬ρ ∧ ¬σ)

viii. de Morgan (II): ¬(ρ ∧ σ) ⇔ (¬ρ ∨ ¬σ). Para la dirección ⇒ es necesario usar principios de razonamiento clásicos.

ix. Conmutatividad (∧): (ρ ∧ σ) ⇒ (σ ∧ ρ)

x. Asociatividad (∧): ((ρ ∧ σ) ∧ τ) ⇔ (ρ ∧ (σ ∧ τ))

xi. Conmutatividad (∨): (ρ ∨ σ) ⇒ (σ ∨ ρ)

xii. Asociatividad (∨): ((ρ ∨ σ) ∨ τ) ⇔ (ρ ∨ (σ ∨ τ))

¿Encuentra alguna relación entre teoremas de adjunción, asociatividad y conmutatividad con algunas de las propiedades demostradas en la práctica 2?

### Ejercicio 6 ★

Demostrar en deducción natural que vale ⊢ σ para cada una de las siguientes fórmulas. Para estas fórmulas es imprescindible **usar lógica clásica**:

i. Absurdo clásico: (¬τ ⇒ ⊥) ⇒ τ

ii. Ley de Peirce: ((τ ⇒ ρ) ⇒ τ) ⇒ τ

iii. Tercero excluido: τ ∨ ¬τ

iv. Consecuencia milagrosa: (¬τ ⇒ τ) ⇒ τ

v. Contraposición clásica: (¬ρ ⇒ ¬τ) ⇒ (τ ⇒ ρ)

vi. Análisis de casos: (τ ⇒ ρ) ⇒ (¬τ ⇒ ρ) ⇒ ρ

vii. Implicación vs. disyunción: (τ ⇒ ρ) ⇔ (¬τ ∨ ρ)

### Ejercicio 7

Probar las siguientes propiedades:

i. **Debilitamiento.** Si Γ ⊢ σ es válido entonces Γ, τ ⊢ σ es válido.
   Sugerencia: utilizar inducción sobre el tamaño de la derivación.

ii. **Regla de corte.** Si Γ, τ ⊢ σ es válido y Γ ⊢ τ es válido, entonces Γ ⊢ σ es válido.

iii. ⇒⁻¹ᵢ: Si Γ ⊢ τ ⇒ σ es válido, entonces Γ, τ ⊢ σ también lo es.

### Ejercicio 8

Si [τ₁, …, τₙ] es una lista de fórmulas, definimos la notación [τ₁, …, τₙ] ⇒* σ inductivamente:

```
([] ⇒* σ)               = σ
([τ₁, τ₂, …, τₙ] ⇒* σ) = τ₁ ⇒ ([τ₂, …, τₙ] ⇒* σ)
```

Probar por inducción en n que τ₁, …, τₙ ⊢ σ es válido si y sólo si ⊢ [τ₁, …, τₙ] ⇒* σ es válido.

### Ejercicio 9

Probar los siguientes teoremas:

i. ((P ⇒ Q) ⇒ Q) ⇒ ((Q ⇒ P) ⇒ P)

ii. (P ⇒ Q) ⇒ ((¬P ⇒ Q) ⇒ Q)

### Ejercicio 10

Demostrar las siguientes tautologías utilizando deducción natural.

i. (P ⇒ (P ⇒ Q)) ⇒ (P ⇒ Q)

ii. (R ⇒ ¬Q) ⇒ ((R ∧ Q) ⇒ P)

iii. ((P ⇒ Q) ⇒ (R ⇒ ¬Q)) ⇒ ¬(R ∧ Q)

---

## Ejercicios extra de deducción natural

### Ejercicio 11

Probar que los siguientes secuentes son válidos sin usar principios de razonamiento clásicos:

i. (P ∧ Q) ∧ R, S ∧ T ⊢ Q ∧ S

ii. (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)

iii. P ⇒ (P ⇒ Q), P ⊢ Q

iv. Q ⇒ (P ⇒ R), ¬R, Q ⊢ ¬P

v. ⊢ (P ∧ Q) ⇒ P

vi. P ⇒ ¬Q, Q ⊢ ¬P

vii. P ⇒ Q ⊢ (P ∧ R) ⇒ (Q ∧ R)

viii. Q ⇒ R ⊢ (P ∨ Q) ⇒ (P ∨ R)

ix. (P ∨ Q) ∨ R ⊢ P ∨ (Q ∨ R)

x. P ∧ (Q ∨ R) ⊢ (P ∧ Q) ∨ (P ∧ R)

xi. (P ∧ Q) ∨ (P ∧ R) ⊢ P ∧ (Q ∨ R)

xii. ¬P ∨ Q ⊢ P ⇒ Q

xiii. P ⇒ Q, P ⇒ ¬Q ⊢ ¬P

xiv. P ⇒ (Q ⇒ R), P, ¬R ⊢ ¬Q

### Ejercicio 12

Probar que los siguientes secuentes son válidos:

i. (P ∧ ¬Q) ⇒ R, ¬R, P ⊢ Q

ii. ¬P ⇒ Q ⊢ ¬Q ⇒ P

iii. P ∨ Q ⊢ R ⇒ (P ∨ Q) ∧ R

iv. (P ∨ (Q ⇒ P)) ∧ Q ⊢ P

v. P ⇒ Q, R ⇒ S ⊢ (P ∧ R) ⇒ (Q ∧ S)

vi. P ⇒ Q ⊢ ((P ∧ Q) ⇒ P) ∧ (P ⇒ (P ∧ Q))

vii. P ⇒ (Q ∧ R) ⊢ (P ⇒ Q) ∧ (P ⇒ R)

viii. (P ⇒ Q) ∧ (P ⇒ R) ⊢ P ⇒ (Q ∧ R)

ix. P ∨ (P ∧ Q) ⊢ P

x. P ⇒ (Q ∨ R), Q ⇒ S, R ⇒ S ⊢ P ⇒ S

xi. (P ∧ Q) ∨ (P ∧ R) ⊢ P ∧ (Q ∨ R)

### Ejercicio 13

Probar que los siguientes secuentes son válidos:

i. ¬P ⇒ ¬Q ⊢ Q ⇒ P

ii. ¬P ∨ ¬Q ⊢ ¬(P ∧ Q)

iii. ¬P, P ∨ Q ⊢ Q

iv. P ∨ Q, ¬Q ∨ R ⊢ P ∨ R

v. P ∧ ¬P ⊢ ¬(R ⇒ Q) ∧ (R ⇒ Q)

vi. ¬(¬P ∨ Q) ⊢ P

vii. ⊢ ¬P ⇒ (P ⇒ (P ⇒ Q))

viii. P ∧ Q ⊢ ¬(¬P ∨ ¬Q)

ix. ⊢ (P ⇒ Q) ∨ (Q ⇒ R)

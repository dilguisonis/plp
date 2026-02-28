# Behavioral Design Patterns

Behavioral patterns are concerned with algorithms and the assignment of responsibilities between objects.

# Chain of CIHIO Responsibility

Lets you pass requests along a chain of handlers. Upon receiving a request,each handler decides either to process the request or to pass it to the next handler in the chain.

![](images/e0448e42c23e2d1198ba2b7049c30790d89aff7ce234216f346ce37859714c87.jpg)

# Command

Turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request's execution,and support undoable operations.

# Iterator

Lets you traverse elements of a collection without exposing its underlying representation (list, stack, tree, etc.).

![](images/43f16b001a3cc5771779e631ff3bd741ad9a92a233d65f46cb643d1df25ab1f8.jpg)

# Mediator

Lets you reduce chaotic dependencies between objects.The pattern restricts direct communications between the objects and forces them to collaborate only via a mediator object.

日

# Memento

Lets you save and restore the previous state of an object without revealing the details of its implementation.

# Observer

Lets you define a subscription mechanism to notify multiple objects about any events that happen to the object they're observing.

![](images/cd1451b5fca308ca379f13a339f3e378813f482f786bb7f5cc79f015b6769249.jpg)

# State

Lets an object alter its behavior when its internal state changes.   
It appears as if the object changed its class.

![](images/523d5296470941490dcc679e6d2a0fbf250fc2921beec7f637f5e0e9260452b2.jpg)

Strategy

Lets you define a family of algorithms,put each of them into a separate class,and make their objects interchangeable.

![](images/5576d3f39e720dd5d3adb927651a91912ece548626dce4942c9ae82574eeb957.jpg)

# Template Method

Defines the skeleton of an algorithm in the superclass but lets subclasses override specific steps of the algorithm without changing its structure.

![](images/c48be57ca43859c0f18416919bd9be316f76bb6fbf7925f24ff89316123cc037.jpg)

# Visitor

Lets you separate algorithms from the objects on which they operate.

![](images/5d9cd8dc27f08eb7a76da5526b342143a5c56a319c6f4e2b2e1f301d4ee2db0c.jpg)

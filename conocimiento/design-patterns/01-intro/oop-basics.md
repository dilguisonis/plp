# INTRODUCTION TO OOP

# Basics of OOP

Object-oriented programming is a paradigm based on the concept of wrapping pieces of data,and behavior related to that data, into special bundles called objects,which are constructed from a set of“blueprints”, defined by a programmer, called classes.

# Objects, classes

Do you like cats? I hope you do because I'll try to explain the OOP concepts using various cat examples.

Cat Name Visibility + hame $+ \ =$ public + gender $- =$ private +age Fields + weight (state) + color   
The ellipsis means ： t tinthesmtare, + breathe()   
but it's not relevant at the moment. + eat(food) + run(destination) Methods (behavior) + sleep(hours) + meow0

This is a UML class diagram. You'llsee a lot of such diagrams in the book.

Say you have a cat named Oscar. Oscar is an object,an instance of the Cat class. Every cat has a lot of standard attributes: name, sex,age,weight,color, favorite food, etc.These are the class's fields.

All cats also behave similarly: they breathe,eat, run, sleep and meow. These are the class's methods. Collectively， fields and methods can be referenced as the members of their class.

Data stored inside the object's fields is often referenced as state,and all the object's methods define its behavior.

![](images/87156d48bf5dde2dcd23534520d87a0af375fac29ede1757446637964d4680c0.jpg)

![](images/7a74146b9d89a0f7e721ce212b7e1a9786535bb46c8a3674ff1fd7b9b1fc7a09.jpg)

# Oscar: Cat

name $=$ "Oscar" sex $=$ "male" age 3 weight 7 color $=$ brown texture $=$ striped

# Luna: Cat

name $=$ "Luna" sex $=$ "female" age 2 weight = 5 color $=$ gray texture $=$ plain

Objects are instances of classes.

Luna,your friend's cat, is also an instance of the Cat class. It has the same set of attributes as Oscar. The difference is in values of these attributes: its sex is female, it has a different color,and weighs less.

So a class is like a blueprint that defines the structure for objects,which are concrete instances of that class.

# Class hierarchies

Everything's fine and dandy when we talk about one class. Naturally, a real program contains more than a single class. Some of these classes might be organized into class hierarchies. Let's find out what that means.

Say your neighbor has a dog called Fido. It turns out, dogs and cats have a lot in common: name, sex,age,and color are attributes of both dogs and cats. Dogs can breathe, sleep and run the same way cats do. So it seems that we can define the base Animal class that would list the common attributes and behaviors.

A parent class, like the one we've just defined, is called a superclass. Its children are subclasses. Subclasses inherit state and behavior from their parent, defining only attributes or behaviors that differ. Thus, the Cat class would have the meow method,and the Dog class the bark method.

Animal Superclass + name + sex +age + weight Arrows with empty triangle + color hedsindisgeirohrtance + breathe() subolas tomasuperclass + eat(food) subclasses can overlap (as in + run(destination) this diagram) or be drawn + sleep(hours) 全 Cat Dog   
- isNasty: bool - bestFriend: Human   
+ meow0 + bark0 Subclasses

UML diagram of a class hierarchy.All classes in this diagram are part of the Animal class hierarchy.

Assuming that we have a related business requirement, we can go even further and extract a more general class for all living Organisms which will become a superclass for Animals and Plants .Such a pyramid of classes is a hierarchy. In such a hierarchy,the Cat class inherits everything from both the Animal and Organism classes.

![](images/21864bd6045c290d1cc71a9c98df8aaca48cb87d431304d98853b09f6649cd74.jpg)  
Classes in a UML diagram can be simplifed if it's more important to show their relations than their contents.

Subclasses can override the behavior of methods that they inherit from parent classes.A subclass can either completely replace the default behavior or just enhance it with some extra stuff.

# Pillars of OOP

Object-oriented programming is based on four pillars,concepts that differentiate it from other programming paradigms.

![](images/9bc6658a80e344e80291c3382adff0f7e5eabc00806683f0aac20723c95bc1ee.jpg)

# Abstraction

Most of the time when you're creating a program with OOP, you shape objects of the program based on real-world objects. However,objects of the program don’t represent the originals with $100 \%$ accuracy (and it's rarely required that they do). Instead,your objects only model attributes and behaviors of real objects in a specific context, ignoring the rest.

For example,an Airplane class could probably exist in both a flight simulator and a flight booking application. But in the former case,it would hold details related to the actual flight, whereas in the latter class you would care only about the seat map and which seats are available.

![](images/f4780f61e7d9cf0bdf63a37b43d6c9d37664855255be1b1b1864e9a6086d4186.jpg)

<table><tr><td>Airplane</td></tr><tr><td>- speed</td></tr><tr><td>- altitude</td></tr><tr><td>- rollAngle</td></tr><tr><td>- pitchAngle</td></tr><tr><td>- yawAngle</td></tr><tr><td>+ fly0</td></tr></table>

<table><tr><td>Airplane</td></tr><tr><td>- seats</td></tr><tr><td>+ reserveSeat(n)</td></tr></table>

Different models of the same real-world object.

Abstraction is a model of a real-world object or phenomenon, limited to a specific context, which represents all details relevant to this context with high accuracy and omits all the rest.

# Encapsulation

To start a car engine, you only need to turn a key or press a button. You don't need to connect wires under the hood, rotate the crankshaft and cylinders,and initiate the power cycle of the engine. These details are hidden under the hood of the car. You have only a simple interface: a start switch,a steering wheel and some pedals. This illustrates how each object has an interface-a public part of an object, open to interactions with other objects.

Encapsulation is the ability of an object to hide parts of its state and behaviors from other objects, exposing only a limited interface to the rest of the program.

To encapsulate something means to make it private ，and thus accessible only from within the methods of its own class. There's a little bit less restrictive mode called protected that makes a member of a class available to subclasses as well.

Interfaces and abstract classes/methods of most programming languages are based on the concepts of abstraction and encapsulation. In modern object-oriented programming languages, theinterfacemechanism(usually declared withthe interface or protocol keyword) lets you define contracts of interaction between objects. That's one of the reasons why the interfaces only care about behaviors of objects,and why you can't declare a field in an interface.

The fact that the word interface stands for a public part of an object, while there's also the interface type in most programming languages, is very confusing.l'm with you on that.

Imagine that you have a FlyingTransport interface with a method fly(origin, destination， passengers). When designing an air transportation simulator, you could restrict the Airport class to work only with objects that implement the FlyingTransport interface. After this, you can be sure that any object passed to an airport object, whether it'san Airplane , a Helicopter orafreaking DomesticatedGryphon Would be able to arrive or depart from this type of airport.

![](images/a463f784696527c89e7499a3807034292001172a532303b00efa8e190f46b43e.jpg)  
UML diagram of several classes implementing an interface.

You could change the implementation of the fly method in these classes in any way you want. As long as the signature of the method remains the same as declared in the interface, all instances of the Airport class can work with your flying objects just fine.

# Inheritance

Inheritance is the ability to build new classes on top of existing ones. The main benefit of inheritance is code reuse. If you want to create a class that's slightly different from an existing one, there's no need to duplicate code. Instead, you extend the existing class and put the extra functionality into a resulting subclass,which inherits fields and methods of the superclass.

The consequence of using inheritance is that subclasses have the same interface as their parent class. You can't hide a method in a subclass if it was declared in the superclass. You must also implement all abstract methods, even if they don't make sense for your subclass.

![](images/dd58179b3c6de4966f52e724fe9bc5ea54d70db6084a98d70ad95b25ae5005a9.jpg)  
UML diagram of extending a single class versus implementing multiple interfaces at the same time.

In most programming languages a subclass can extend only one superclass.On the other hand,any class can implement several interfaces at the same time. But,as l mentioned before, if a superclass implements an interface,all of its subclasses must also implement it.

# Polymorphism

Let's look at some animal examples.Most Animals can make sounds.We can anticipate that all subclasses will need to override the base makeSound method so each subclass can emit the correct sound; therefore we can declare it abstract right away. This lets us omit any default implementation of the method in the superclass, but force allsubclasses to come up with their own.

![](images/0a94ecef3cd5f3c2946d898f9ca909a28999185791e9164e43900002d7ba349f.jpg)  
These are UML comments.Usually they explain implementation details of the given classes or methods.

Imagine that we've put several cats and dogs into a large bag. Then,with closed eyes,we take the animals one-by-one out of the bag. After taking an animal from the bag,we don't know for sure what it is. However, if we cuddle it hard enough, the animal will emit a specific sound of joy, depending on its concrete class.

1 bag $=$ [new Cat $( )$ ，new Dog()];   
2   
3 foreach (Animal a : bag)   
4 a.makeSound()   
5   
6 // Meow!   
7 // Woof!

The program doesn't know the concrete type of the object contained inside the a variable; but, thanks to the special mechanism called polymorphism, the program can trace down the subclass of the object whose method is being executed and run the appropriate behavior.

Polymorphism is the ability of a program to detect the real class of an object and call its implementation even when its real type is unknown in the current context.

You can also think of polymorphism as the ability of an object to “pretend” to be something else,usually a class it extends or an interface it implements. In our example, the dogs and cats in the bag were pretending to be generic animals.

# Relations Between Objects

In addition to inheritance and implementation that we've already seen, there are other types of relations between objects that we haven't talked about yet.

# Dependency

![](images/db72269efc1f4496248f769b4f43346bf902845600ab4dadf6decc4d8c5cd193.jpg)  
UML Dependency. Professor depends on the course materials.

Dependency is the most basic and the weakest type of relations between classes. There is a dependency between two classes if some changes to the definition of one class might result in modifications to another class. Dependency typically occurs when you use concrete class names in your code. For example, when specifying types in method signatures,when instantiating objects via constructor calls,etc. You can make a dependency weaker if you make your code dependent on interfaces or abstract classes instead of concrete classes.

Usually，a UML diagram doesn't show every dependency-there are far too many of them in any real code. Instead of polluting the diagram with dependencies, you should be very selective and show only those that are important to whatever it is you are communicating.

# Association

![](images/4ed3eb746e14aa5919b847ecfa7acdd165a40fdac63a9f1e82b3143529aec50b.jpg)  
UML Association.Professor communicates with students.

Association is a relationship in which one object uses or interacts with another. In UML diagrams, the association relationship is shown by a simple arrow drawn from an object and pointing to the object it uses. By the way, having a bi-directional association is a completely normal thing.In this case, the arrow has a point at each end. Association can be seen as a specialized kind of dependency, where an object always has access to the objects with which it interacts,whereas simple dependency doesn't establish a permanent link between objects.

In general, you use an association to represent something like a field in a class. The link is always there,in that you can always ask an order for its customer. But it doesn't always have to be a field.If you are modeling your classes from an interface perspective,it can just indicate the presence of a method that will return the order's customer.

To solidify your understanding of the difference between association and dependency, let's look at a combined example. Imagine that we have a Professor class:

1 class Professor is   
2 field Student student   
3   
4 method teach(Course c） is   
5   
6 this.student.remember(c.getKnowledge())

Take a look at the teach method. It takes an argument of the Course class,which is then used in the body of the method. If Someone changes the getKnowledge method of the Course class (alters its name,or adds some required parameters,etc.) our code will break. This is called a dependency.

Now, look at the student field and how it's used in the teach method.We can say for sure that the Student class is also a dependency for the Professor : if the method remember changes,the Professor 's code will break. However, since the student field is always accessible to any method of the Professor ,the Student class is not just a dependency, but also an association.

# Aggregation

Department □ Professor

UML Aggregation. Department contains professors.

Aggregation is a specialized type of association that represents“one-to-many”,“many-to-many”or“whole-part" relations between multiple objects.

Usually, under aggregation,an object“has”a set of other objects and serves as a container or collection.The component can exist without the container and can be linked to several containers at the same time.In UML the aggregation relationship is shown by a line with an empty diamond at the container end and an arrow at the end pointing toward the component.

While we talk about relations between objects, keep in mind that UML represents relations between classes.It means that a university object might consist of multiple departments even though you see just one“block" for each entity in the diagram. UML notation can represent quantities on both sides of relationships,but it's okay to omit them if the quantities are clear from the context.

# Composition

![](images/9870848a99026a9932dbcaab1afdcc76b3e8563328d2f57133a208b6447e838c.jpg)  
UML Composition. University consists of departments.

Composition is a specific kind of aggregation, where one object is composed of one or more instances of the other. The distinction between this relation and others is that the component can only exist as a part of the container. In UML the composition relationship is drawn the same as for aggregation,but with a filled diamond at the arrow's base.

Note that many people often use the term “composition”when they really mean both the aggregation and composition.The most notorious example for this is the famous principle "choose composition over inheritance." It's not because people are ignorant about the difference, but rather because the word "composition” (e.g.“object composition") sounds more natural in the English language.

# The big picture

Now that we know all types of relations between objects let's see how they all are connected. Hopefully, this will guide you through questions like“what is the difference between aggregation and composition”or“is inheritance a type of dependency?”

Dependency: Class A can be affected by changes in class B.

Association: Object A knows about object B. Class A depends on B.

Aggregation: Object A knows about object B,and consists of B.   
Class A depends on B.

Composition: Object A knows about object B, consists of B,and manages B's life cycle. Class A depends on B.

Implementation: Class A defines methods declared in interface B. Objects A can be treated as B. Class A depends on B.

Inheritance: Class A inherits interface and implementation of class B but can extend it. Objects A can be treated as B. Class A depends on B.

![](images/83fea83e26fab49f41c8dd4510b5223335df6291bd2e7dd78f261bf73eeeb753.jpg)

Relations between objects and classes: from weakest to strongest.

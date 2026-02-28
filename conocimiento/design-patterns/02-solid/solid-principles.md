# SOLID Principles

Now that you know the basic design principles, let's take a look at five that are commonly known as the SOLID principles. Robert Martin introduced them in the book Agile Software Development, Principles,Patterns,and Practices1.

SOLID is a mnemonic for five design principles intended to make software designs more understandable, flexible and maintainable.

As with everything in life,using these principles mindlessly can cause more harm than good. The cost of applying these principles into a program's architecture might be making it more complicated than it should be.l doubt that there's a successful software product in which all of these principles are applied at the same time. Striving for these principles is good, but always try to be pragmatic and don't take everything written here as dogma.

# Single Responsibility Principle

A class should have just one reason to change.

Try to make every class responsible for a single part of the functionality provided by the software,and make that responsibility entirely encapsulated by (you can also say hidden within) the class.

The main goal of this principle is reducing complexity. You don't need to invent a sophisticated design for a program that only has about 2Oo lines of code.Make a dozen methods pretty, and you'll be fine.

The real problems emerge when your program constantly grows and changes. At some point classes become so big that you can no longer remember their details. Code navigation slows down to a crawl,and you have to scan through whole classes or even an entire program to find specific things. The number of entities in program overflows your brain stack,and you feel that you're losing control over the code.

There's more: if a class does too many things,you have to change it every time one of these things changes.While doing that, you're risking breaking other parts of the class which you didn't even intend to change.

If you feel that it's becoming hard to focus on specific aspects of the program one at a time,remember the single responsibil-ity principle and check whether it's time to divide some classes into parts.

# Example

The Employee class has several reasons to change. The frst reason might be related to the main job of the class: managing employee data. However, there's another reason: the format of the timesheet report may change over time, requiring you to change the code within the class.

<table><tr><td>Employee</td></tr><tr><td>- name</td></tr><tr><td>+ getName()</td></tr><tr><td>+ printTimeSheetReport()</td></tr></table>

BEFORE:the class contains several different behaviors.

Solve the problem by moving the behavior related to printing timesheet reports into a separate class. This change lets you move other report-related stuff to the new class.

TimeSheetReport Employee ->-name + print(employee) + getName()

AFTER:the extra behavior is in its own class.

# Open/Closed Principle

Classes should be open for extension but closed for modification.

The main idea of this principle is to keep existing code from breaking when you implement new features.

A class is open if you can extend it, produce a subclass and do whatever you want with it-add new methods or fields, override base behavior, etc.Some programming languages let you restrict further extension of a class with special keywords, such as final . After this, the class is no longer open. At the same time, the class is closed (you can also say complete) if it's $100 \%$ ready to be used by other classes-its interface is clearly defined and won't be changed in the future.

When l first learned about this principle, I was confused because the words open & closed sound mutually exclusive. But in terms of this principle,a class can be both open (for extension) and closed (for modification) at the same time.

If a class is already developed, tested, reviewed,and included in some framework or otherwise used in an app, trying to mess with its code is risky. Instead of changing the code of the class directly, you can create a subclass and override parts of the original class that you want to behave differently. You'll achieve your goal but also won't break any existing clients of the original class.

This principle isn't meant to be applied for all changes to a class. If you know that there's a bug in the class, just go on and fix it; don't create a subclass for it. A child class shouldn't be responsible for the parent's issues.

# Example

You have an e-commerce application with an Order class that calculates shipping costs and all shipping methods are hardcoded inside the class. If you need to add a new shipping method,you have to change the code of the Order class and risk breaking it.

if (shipping $= =$ "ground") { Order // Free ground delivery on big orders. if (getTotal $1 0 > 1 0 0$ {   
- lineltems return 0   
- shipping }   
$^ +$ getTotal() // \$1.5 per kilogram, but return max(10, getTotalWeight() $\$ 10$ minimum. $^ { * } 1 . 5$   
$^ +$ getTotalWeight( }   
$^ +$ setShipping Type(st)   
$^ +$ getShippingCost( o if (shipping $= =$ "air") {   
+ getShippingDate0 // \$3 per kilogram, but $\$ 20$ minimum. return max(20,getTotalWeight() \* 3) }

BEFORE: you have to change the Order class whenever you add a new shipping method to the app.

You can solve the problem by applying the Strategy pattern. Start by extracting shipping methods into separate classes with a common interface.

![](images/bc202d3a20ddc9d1370e36f72aa35ca49d5388d9808fceb2366fdef02a096af9.jpg)  
AFTER: adding a new shipping method doesn't require changing existing classes.

Now when you need to implement a new shipping method, you can derive a new class from the Shipping interface without touching any of the Order class' code. The client code of the 0rder class will link orders with a shipping object of the new class whenever the user selects this shipping methods in the Ul.

As a bonus, this solution let you move the delivery time calculation to more relevant classes,according to the single responsibility principle.

# Liskov Substitution Principle

When extending a class, remember that you should be able to pass objects of the subclass in place of objects of the parent class without breaking the client code.

This means that the subclass should remain compatible with the behavior of the superclass. When overriding a method, extend the base behavior rather than replacing it with something else entirely.

The substitution principle is a set of checks that help predict whether a subclass remains compatible with the code that was able to work with objects of the superclass.This concept is critical when developing libraries and frameworks because your classes are going to be used by other people whose code you can't directly access and change.

Unlike other design principles which are wide open for interpretation, the substitution principle has a set of formal requirements for subclasses,and specifically for their methods. Let's go over this checklist in detail.

Parameter types in a method of a subclass should match or be more abstract than parameter types in the method of the superclass. Sounds confusing? Let's have an example.

。Say there's a class with a method that's supposed to feed cats: feed(Cat c） . Client code always passes cat objects into this method.

。 Good: Say you created a subclass that overrode the method so that it can feed any animal (a superclass of cats): feed(Animal c） .Now if you pass an object of this subclass instead of an object of the superclass to the client code, everything would still work fine.The method can feed all animals,so it can still feed any cat passed by the client.

Bad: You created another subclass and restricted the feeding method to only accept Bengal cats (a subclass of cats): feed(BengalCat c） .What will happen to the client code if you link it with an object like this instead of with the original class? Since the method can only feed a specific breed of cats,it won't serve generic cats passed by the client, breaking all related functionality.

The return type in a method of a subclass should match or be a subtype of the return type in the method of the superclass. As you can see,requirements for a return type are inverse to requirements for parameter types.

。 Say you have a class with a method buyCat(): Cat .The client code expects to receive any cat as a result of executing this method.

。Good: A subclass overrides the method as follows: buyCat(): BengalCat . The client gets a Bengal cat, which is still a cat,so everything is okay.

。Bad: A subclass overrides the method as follows: buyCat(): Animal .Now the client code breaks since it receives an unknown generic animal (an alligator? a bear?) that doesn't fit a structure designed for a cat.

Another anti-example comes from the world of programming languages with dynamic typing: the base method returns a string, but the overridden method returns a number.

A method in a subclass shouldn't throw types of exceptions which the base method isn't expected to throw. In other words, types of exceptions should match or be subtypes of the ones that the base method is already able to throw. This rule comes from the fact that try-catch blocks in the client code target specific types of exceptions which the base method is likely to throw.Therefore,an unexpected exception might slip through the defensive lines of the client code and crash the entire application.

In most modern programming languages, especially statically typed ones (Java, C#,and others), these rules are built into the language. You won't be able to compile a program that violates these rules.

A subclass shouldn't strengthen pre-conditions. For example, the base method has a parameter with type int .If a subclass overrides this method and requires that the value of an argument passed to the method should be positive (by throwing an exception if the value is negative), this strengthens the pre-conditions.The client code,which used to work fine when passing negative numbers into the method, now breaks if it starts working with an object of this subclass.

A subclass shouldn't weaken post-conditions. Say you have a class with a method that works with a database.A method of the class is supposed to always close all opened database connections upon returning a value.

You created a subclass and changed it so that database connections remain open so you can reuse them. But the client might not know anything about your intentions. Because it expects the methods to close all the connections, it may simply terminate the program right after calling the method, polluting a system with ghost database connections.

Invariants of a superclass must be preserved.This is probably the least formal rule of all. Invariants are conditions in which an object makes sense. For example, invariants of a cat are having four legs,a tail,ability to meow, etc. The confusing part about invariants is that while they can be defined explicitly in the form of interface contracts or a set of assertions within methods, they could also be implied by certain unit tests and expectations of the client code.

The rule on invariants is the easiest to violate because you might misunderstand or not realize all of the invariants of a complex class. Therefore, the safest way to extend a class is to introduce new fields and methods,and not mess with any existing members of the superclass. Of course, that's not always doable in real life.

A subclass shouldn't change values of private fields of the superclass.What? How's that even possible? It turns out some programming languages let you access private members of a class via reflection mechanisms. Other languages (Python, JavaScript) don't have any protection for the private members at all.

# Example

Let's look at an example of a hierarchy of document classes that violates the substitution principle.

Document Project   
- data - documents   
- filename foreach (doc in documents) {   
+ aeno +openAloO } doc.open( 4 freach (doc indocuments) [ if (!doc instanceof ReadOnlyDocument)   
ReadOnlyDocument doc.save( } }   
+ save0o ：

throw new Exception(“Unable to save read-only file.")

BEFORE: saving doesn't make sense in α read-only document, so the subclass tries to solve it by resetting the base behavior in the overridden method.

The save method in the ReadOnlyDocuments subclass throws an exception if someone tries to call it. The base method doesn't have this restriction. This means that the client code will break if we don't check the document type before saving it.

The resulting code also violates the open/closed principle, since the client code becomes dependent on concrete classes of documents.If you introduce a new document subclass, you'll need to change the client code to support it.

![](images/2f4c57cade2eb492f35471c7b1965ec3746fc0ef647b45beef3f66f0169c3375.jpg)  
AFTER: the problem is solved after making the read-only document class the base class of the hierarchy.

You can solve the problem by redesigning the class hierarchy: a subclass should extend the behavior of a superclass, therefore the read-only document becomes the base class of the hierarchy. The writable document is now a subclass which extends the base class and adds the saving behavior.

# Interface Segregation Principle

Clients shouldn't be forced to depend on methods they do not use.

Try to make your interfaces narrow enough that client classes don't have to implement behaviors they don't need.

According to the interface segregation principle,you should break down“fat” interfaces into more granular and specific ones. Clients should implement only those methods that they really need. Otherwise,a change to a“fat” interface would break even clients that don't use the changed methods.

Class inheritance lets a class have just one superclass, but it doesn't limit the number of interfaces that the class can implement at the same time. Hence, there's no need to cram tons of unrelated methods to a single interface. Break it down into several more refined interfaces-you can implement them all in a single class if needed. However, some classes may be fine with implementing just one of them.

# Example

Imagine that you created a library that makes it easy to integrate apps with various cloud computing providers.While in the initial version it only supported Amazon Cloud, it covered the full set of cloud services and features.

At the time you assumed that all cloud providers have the same broad spectrum of features as Amazon. But when it came to implementing support for another provider, it turned out that most of the interfaces of the library are too wide. Some methods describe features that other cloud providers just don't have.

![](images/837871c3b80653b549d29c3fe6c358cfd6fa7685e5c42d4b75a4fc370e3ec3e0.jpg)  
BEFORE: not all clients can satisfy the requirements of the bloated interface.

While you can still implement these methods and put some stubs there,it wouldn't be a pretty solution.The better approach is to break down the interface into parts. Classes that are able to implement the original interface can now just implement several refined interfaces. Other classes can implement only those interfaces which have methods that make sense for them.

![](images/c2ef01a544c6c3d1a6a52a1f2929548caf5ffd9b51e181060455ec344ab86ee6.jpg)  
AFTER: one bloated interface is broken down into α set of more granular interfaces.

As with the other principles,you can go too far with this one. Don't further divide an interface which is already quite specific. Remember that the more interfaces you create,the more complex your code becomes. Keep the balance.

# Dependency Inversion Principle

High-level classes shouldn't depend on low-level classes.Both should depend on abstractions.Abstractions shouldn't depend on details. Details should depend on abstractions.

Usually when designing software, you can make a distinction between two levels of classes.

Low-level classes implement basic operations such as working with a disk, transferring data over a network, connecting to a database, etc.

High-level classes contain complex business logic that directs low-level classes to do something.

Sometimes people design low-level classes first and only then start working on high-level ones. This is very common when you start developing a prototype on a new system,and you're not even sure what's possible at the higher level because low-level stuff isn't yet implemented or clear. With such an approach business logic classes tend to become dependent on primitive low-level classes.

The dependency inversion principle suggests changing the direction of this dependency.

1.For starters,you need to describe interfaces for low-level operations that high-level classes rely on, preferably in business terms.For instance，business logic should call a method openReport(file) ratherthanaseriesofmethods openFile $( \times )$ ，readBytes(n），closeFile(x) .These interfaces count as high-level ones.

2. Now you can make high-level classes dependent on those interfaces, instead of on concrete low-level classes. This dependency will be much softer than the original one.

3.Once low-level classes implement these interfaces， they become dependent on the business logic level, reversing the direction of the original dependency.

The dependency inversion principle often goes along with the open/closed principle: you can extend low-level classes to use with different business logic classes without breaking existing classes.

# Example

In this example, the high-level budget reporting class uses a low-level database class for reading and persisting its data. This means that any change in the low-level class, such as when a new version of the database server gets released, may affect the high-level class,which isn't supposed to care about the data storage details.

High level Low level MySQLDatabase BudgetReport - database + insert(   
+ open(date) + update()   
+save0 +delete0

BEFORE: a high-level class depends on a low-level class.

You can fix this problem by creating a high-level interface that describes read/write operations and making the reporting class use that interface instead of the low-level class. Then you can change or extend the original low-level class to implement the new read/write interface declared by the business logic.

High level Abstraction BudgetReport 《interface> Database   
- database + insert(0   
+ open(date) + update()   
+ save() +delete() 全 MySQL MongoDB ··· ··· + insert0 + insert0 + update( + update( Low level +delete) +delete(

AFTER: low-level classes depend on a high-level abstraction.

As a result, the direction of the original dependency has been inverted: low-level classes are now dependent on high-level abstractions.

# CATALOG OF DESIGN PATTERNS

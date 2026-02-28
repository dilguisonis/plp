# COMPOSITE

Also known as: Object Tree

Composite is a structural design pattern that lets you compose objects into tree structures and then work with these structures as if they were individual objects.

# Problem

Using the Composite pattern makes sense only when the core model of your app can be represented as a tree.

For example,imagine that you have two types of objects: Products and Boxes ．A Box cancontain several Products as well as a number of smaller Boxes .These little Boxes can also hold some Products or even smaller Boxes ,and so on.

![](images/0aa8d991ebdcff3e1d26af3e8ba12e18790071617aed94659ec86d457ac0dfb8.jpg)

An order might comprise various products,packaged in boxes,which are packaged in bigger boxes and so on. The whole structure looks like an upside down tree.

Say you decide to create an ordering system that uses these classes. Orders could contain simple products without any wrapping,as well as boxes stuffed with products...and other boxes. How would you determine the total price of such an order?

You could try the direct approach: unwrap all the boxes, go over all the products and then calculate the total. That would be doable in the real world; but in a program,it's not as simple as running a loop. You have to know the classes of Products and Boxes you're going through, the nesting level of the boxes and other nasty details beforehand.All of this makes the direct approach either too awkward or even impossible.

# Solution

The Composite pattern suggests that you work with Products and Boxes through a common interface which declares a method for calculating the total price.

How would this method work? For a product, it'd simply return the product's price. For a box,it'd go over each item the box contains,ask its price and then return a total for this box. If one of these items were a smaller box, that box would also start going over its contents and so on, until the prices of all inner components were calculated.A box could even add some extra cost to the final price, such as packaging cost.

![](images/a760a58dd4cf7917d167c07dd2fa49f3efc5543e8b36770ff865df41c39980aa.jpg)  
The Composite pattern lets you run a behavior recursively over all components of an object tree.

The greatest benefit of this approach is that you don't need to care about the concrete classes of objects that compose the tree.You don't need to know whether an object is a simple product or a sophisticated box.You can treat them all the same via the common interface.When you call a method, the objects themselves pass the request down the tree.

# Real-World Analogy

![](images/6797bf584a52226cc14a6ddbde3c1b9ee9b3893847cb1a37ca880190c09b0f5a.jpg)

An example of a military structure.

Armies of most countries are structured as hierarchies. An army consists of several divisions； a division is a set of brigades,and a brigade consists of platoons,which can be broken down into squads. Finally, a squad is a small group of real soldiers. Orders are given at the top of the hierarchy and passed down onto each level until every soldier knows what needs to be done.

# Structure

![](images/109e8bde353d868eed8435826ea03314551ecd90afbacc9cedcb895c5ff224c3.jpg)

1.The Component interface describes operations that are common to both simple and complex elements of the tree.

2.The Leaf is a basic element of a tree that doesn't have sub-elements.

Usually, leaf components end up doing most of the real work, since they don't have anyone to delegate the work to.

3.The Container (aka composite) is an element that has sub-elements: leaves or other containers.A container doesn't know the concrete classes of its children. It works with all sub-elements only via the component interface.

Upon receiving a request,a container delegates the work to its sub-elements, processes intermediate results and then returns the final result to the client.

4.The Client works with all elements through the component interface. As a result, the client can work in the same way with both simple or complex elements of the tree.

# # Pseudocode

In this example, the Composite pattern lets you implement stacking of geometric shapes in a graphical editor.

<table><tr><td>《interface》 Graphic</td><td>N</td><td>ImageEditor</td></tr><tr><td>+ move(x, y) + draw0</td><td colspan="2"></td></tr><tr><td>A</td><td colspan="2"></td></tr><tr><td>A Dot</td><td colspan="2">A CompoundGraphic</td></tr><tr><td></td><td colspan="2">- chitdren: Graphic[]</td></tr><tr><td>x,y + Dot(x,y)</td><td colspan="2">+ add(child: Graphic)</td></tr><tr><td>+ move(x, y) + draw0</td><td colspan="2">+ remove(child: Graphic) + move(x,y) + draw0</td></tr><tr><td>全</td><td colspan="2"></td></tr><tr><td>Circle</td><td colspan="2"></td></tr><tr><td>radius + Circle(x, y, radius)</td><td colspan="2"></td></tr></table>

The geometric shapes editor example.

The CompoundGraphic class is a container that can comprise any number of sub-shapes,including other compound shapes. A compound shape has the same methods as a simple shape. However, instead of doing something on its own,a compound shape passes the request recursively to all its children and "sums up" the result.

The client code works with all shapes through the single interface common to all shape classes. Thus, the client doesn't know whether it's working with a simple shape or a compound one. The client can work with very complex object structures without being coupled to concrete classes that form that structure.

1 // The component interface declares common operations for both   
2 // simple and complex objects of a composition.   
3 interface Graphic is   
4 method move(x，y)   
5 method draw()   
6   
7 // The leaf class represents end objects of a composition. A   
8 // leaf object can't have any sub-objects. Usually， it's leaf   
9 // objects that do the actual work，while composite objects only   
10 // delegate to their sub-components.   
11 class Dot implements Graphic is   
12 field x， y   
13   
14 constructor Dot(x， y） { .. }   
15   
16 method move(x，y） is   
17 this.x $+ = \times$ ， this.y $+ = \textsf { y }$   
18   
19 method draw $( )$ is   
20 // Draw a dot at X and Y.   
21   
22 // All component classes can extend other components.   
23 class Circle extends Dot is   
24 field radius   
25   
26   
27 constructor Circle(x， y, radius）{ .\*. }   
28   
29 method draw $( )$ is   
30 // Draw a circle at X and Y with radius R.   
31   
32 // The composite class represents complex components that may   
33 // have children. Composite objects usually delegate the actui   
34 // work to their children and then "sum up" the result.   
35 class CompoundGraphic implements Graphic is   
36 field children: array of Graphic   
37   
38 // A composite object can add or remove other components   
39 // (both simple or complex) to or from its child list.   
40 method add(child: Graphic） is   
41 // Add a child to the array of children.   
42   
43 method remove(child: Graphic） is   
44 // Remove a child from the array of children.   
45   
46 method move(x，y） is   
47 foreach (child in children） do   
48 child.move(x，y)   
49   
50 // A composite executes its primary logic in a particular   
51 // way. It traverses recursively through all its children,   
52 // collecting and summing up their results. Since the   
53 // composite's children pass these calls to their own   
54 // children and so forth， the whole object tree is traverse(   
55 // as a result.   
56 method draw(） is   
57 // 1. For each child component:   
58 / - Draw the component.   
59 // - Update the bounding rectangle.   
60 // 2.Draw a dashed rectangle using the bounding   
61 // coordinates.   
62   
63   
64 // The client code works with all the components via their bas   
65 // interface. This way the client code can support simple leaf   
66 // components as well as complex composites.   
67 class ImageEditor is   
68 field all: CompoundGraphic   
69   
70 method load $( )$ is   
71 all $=$ new CompoundGraphic $( )$   
72 all.add(new Dot(1, 2))   
73 all.add(new Circle(5，3, 10))   
74 / .   
75   
76 // Combine selected components into one complex composite   
77 // component.   
78 method groupSelected(components: array of Graphic） is   
79 group $=$ new CompoundGraphic $( )$   
80 foreach （component in components） do   
81 group.add(component)   
82 all.remove(component)   
83 all.add(group)   
84 // All components will be drawn.   
85 all.draw()

# Applicability

Use the Composite pattern when you have to implement a tree-like object structure.

The Composite pattern provides you with two basic element types that share a common interface: simple leaves and complex containers.A container can be composed of both leaves and other containers.This lets you construct a nested recursive object structure that resembles a tree.

Use the pattern when you want the client code to treat both simple and complex elements uniformly.

Allelements defined by the Composite pattern share acommon interface. Using this interface, the client doesn't have to wory about the concrete class of the objects it works with.

# How to Implement

1.Make sure that the core model of your app can be represented as a tree structure. Try to break it down into simple elements and containers. Remember that containers must be able to contain both simple elements and other containers.

2.Declare the component interface with a list of methods that make sense for both simple and complex components.

3.Create a leaf class to represent simple elements. A program may have multiple different leaf classes.

4.Create a container class to represent complex elements. In this class, provide an array field for storing references to subelements. The array must be able to store both leaves and containers,so make sure it's declared with the component interface type.

While implementing the methods of the component interface, remember that a container is supposed to be delegating most of the work to sub-elements.

5.Finally， define the methods for adding and removal of child elements in the container.

Keep in mind that these operations can be declared in the component interface.This would violate the Interface Segregation Principle because the methods will be empty in the leaf class. However, the client will be able to treat all the elements equally, even when composing the tree.

# Pros and Cons

You can work with complex tree structures more conveniently: use polymorphism and recursion to your advantage.

Open/Closed Principle. You can introduce new element types into the app without breaking the existing code,which now works with the object tree.

XIt might be difficult to provide a common interface for classes whose functionality differs too much. In certain scenarios, you'd need to overgeneralize the component interface,making it harder to comprehend.

# ← Relations with Other Patterns

You can use Builder when creating complex Composite trees because you can program its construction steps to work recursively.

Chain of Responsibility is often used in conjunction with Composite.In this case,when a leaf component gets a request, it may pass it through the chain of all of the parent components down to the root of the object tree.

You can use Iterators to traverse Composite trees.

You can use Visitor to execute an operation over an entire Composite tree.

You can implement shared leaf nodes of the Composite tree as Flyweights to save some RAM.

Composite and Decorator have similar structure diagrams since both rely on recursive composition to organize an openended number of objects.

A Decorator is like a Composite but only has one child component. There's another significant difference: Decorator adds additional responsibilities to the wrapped object, while Composite just“sums up”its children's results.

However, the patterns can also cooperate: you can use Decorator to extend the behavior of a specific object in the Composite tree.

Designs that make heavy use of Composite and Decorator can often benefit from using Prototype. Applying the pattern lets you clone complex structures instead of re-constructing them from scratch.

![](images/fa1bb75b6247c08403a9429f5d2a9ed032356b6db64b7693bcd902b741723503.jpg)

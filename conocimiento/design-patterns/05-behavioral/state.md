STATE

State is a behavioral design pattern that lets an object alter its behavior when its internal state changes. It appears as if the object changed its class.

The State pattern is closely related to the concept of a Finite-State Machine.

![](images/00d122e71fd4ecbeafa7b51477927641fbc0aebe700aa8d0841c03f1c634eae1.jpg)  
Finite-State Machine.

The main idea is that,at any given moment, there's a finite number of states which a program can be in.Within any unique state,the program behaves differently,and the program can be switched from one state to another instantaneously. However, depending on a current state,the program may or may not switch to certain other states.These switching rules, called transitions,are also finite and predetermined.

You can also apply this approach to objects. Imagine that we have a Document class.A document can be in one of three States: Draft ，Moderation and Published .The publish method of the document works a little bit differently in each state:

In Draft ,it moves the document to moderation.   
In Moderation ,it makes the document public, but only if the current user is an administrator.   
In Published,itdoesn't do anything at all.

![](images/b390a26cff6b89d941a03d360e6e220eae9ff5846529b0e31fea6ef095e91b20.jpg)  
Possible states and transitions of a document object.

State machines are usually implemented with lots of conditional operators( if or switch ） that select the appropriate behavior depending on the current state of the object. Usually, this “state”is just a set of values of the object's fields. Even if you've never heard about finite-state machines before, you've probably implemented a state at least once. Does the following code structure ring a bell?

1 class Document is 2 field state: string 3 // 4 method publish $( )$ is 5 switch (state) 6 "draft": 7 state $=$ "moderation" 8 break 9 "moderation": 10 if (currentUser.role $= =$ 'admin') 11 state $=$ "published" 12 break 13 "published" : 14 // Do nothing. 15 break 16

The biggest weakness of a state machine based on conditionals reveals itself once we start adding more and more states and state-dependent behaviors to the Document class. Most methods will contain monstrous conditionals that pick the proper behavior of a method according to the current state. Code like this is very difficult to maintain because any change to the transition logic may require changing state conditionals in every method.

The problem tends to get bigger as a project evolves. It's quite difficult to predict all possible states and transitions at the design stage. Hence, a lean state machine built with a limited set of conditionals can grow into a bloated mess over time.

The State pattern suggests that you create new classes for all possible states of an object and extract all state-specific behaviors into these classes.

Instead of implementing all behaviors on its own,the original object, called context, stores a reference to one of the state objects that represents its current state,and delegates all the state-related work to that object.

![](images/f828815a2f41d363bb36e214e6042557a27e268c8b1301be829571ffde9547b5.jpg)  
Document delegates the work to α state object.

To transition the context into another state, replace the active state object with another object that represents that new state.This is possible only if all state classes follow the same interface and the context itself works with these objects through that interface.

This structure may look similar to the Strategy pattern, but there's one key difference.In the State pattern, the particular states may be aware of each other and initiate transitions from one state to another, whereas strategies almost never know about each other.

# Real-World Analogy

The buttons and switches in your smartphone behave differently depending on the current state of the device:

When the phone is unlocked, pressing buttons leads to executing various functions.   
When the phone is locked, pressing any button leads to the unlock screen.   
When the phone's charge is low, pressing any button shows the charging screen.

# 品Structure

① 2 Context 《interface》 - state State +doThis0 + Context(initialState) + doThat0 全 1 ConcreteStates ③   
this.state $=$ state A state.doThis0 - context   
state.setContext(this) + setContext(context) Client >+ doThis() 1 +doThat0 ： initialState $=$ new ConcreteState() context $=$ new Context(initialState) context.doThis() // A state may issue state A // Current state may have been // transition in context. // changed by context or the state state $=$ new OtherState() // object itself. context.changeState(state)

1.Context stores a reference to one of the concrete state objects and delegates to it all state-specific work. The context communicates with the state object via the state interface. The context exposes a setter for passing it a new state object.

2.The State interface declares the state-specific methods. These methods should make sense for all concrete states because you don't want some of your states to have useless methods that will never be called.

3. Concrete States provide their own implementations for the state-specific methods. To avoid duplication of similar code across multiple states, you may provide intermediate abstract classes that encapsulate some common behavior.

State objects may store a backreference to the context object. Through this reference, the state can fetch any required info from the context object, as well as initiate state transitions.

4.Both context and concrete states can set the next state of the context and perform the actual state transition by replacing the state object linked to the context.

# # Pseudocode

In this example, the State pattern lets the same controls of the media player behave differently, depending on the current playback state.

![](images/f3d9c36b7e3ded334394e55c8d9c5483aea6169a546833abb1d81c2039937f12.jpg)  
Example of changing object behavior with state objects.

The main object of the player is always linked to a state object that performs most of the work for the player. Some actions replace the current state object of the player with another, which changes the way the player reacts to user interactions.

1 // The AudioPlayer class acts as a context. It also maintaing   
2 // reference to an instance of one of the state classes that   
3 // represents the current state of the audio player.   
4 class AudioPlayer is   
5 field state: State   
6 field UI，volume，playlist， currentSong   
7   
8 constructor AudioPlayer $( )$ is   
9 this.state $=$ new ReadyState(this)   
10   
11 // Context delegates handling user input to a state   
12 // object. Naturally， the outcome depends on what state   
13 // is currently active， since each state can handle the   
14 // input differently.   
15 $\ U { \ I } \ =$ new UserInterface()   
16 UI.lockButton.onClick(this.clickLock)   
17 UI.playButton.onClick(this.clickPlay)   
18 UI.nextButton.onClick(this.clickNext)   
19 UI.prevButton.onClick(this.clickPrevious)   
20   
21 // Other objects must be able to switch the audio player's   
22 // active state.   
23 method changeState(state: State) is   
24 this.state $=$ state   
27 // UI methods delegate execution to the active state.   
28 method clickLock $( )$ is   
29 state.clickLock()   
30 method clickPlay $( )$ is   
31 state.clickPlay()   
32 method clickNext $( )$ is   
33 state.clickNext $( )$   
34 method clickPrevious $( )$ is   
35 state.clickPrevious $( )$   
36   
37 // A state may call some service methods on the context.   
38 method startPlayback $( )$ is   
39 //   
40 method stopPlayback $( )$ is   
41 //   
42 method nextSong $( )$ is   
43 //   
44 method previousSong $( )$ is   
45 ：   
46 method fastForward(time) is   
47 // ：   
48 method rewind(time） is   
49 // ..   
50   
51   
52 // The base state class declares methods that all concrete   
53 // states should implement and also provides a backreference to   
54 // the context object associated with the state. States can use   
55 // the backreference to transition the context to another state.   
56 abstract class State is   
57 protected field player: AudioPlayer   
58   
59 // Context passes itself through the state constructor. This   
60 // may help a state fetch some useful context data if it's   
61 // needed.   
62 constructor State(player) is   
63 this.player $=$ player   
64   
65 abstract method clickLock $( )$   
66 abstract method clickPlay $( )$   
67 abstract method clickNext $( )$   
68 abstract method clickPrevious $( )$   
69   
70   
71 // Concrete states implement various behaviors associated with   
72 // state of the context.   
73 class LockedState extends State is   
74   
75 // When you unlock a locked player，it may assume one of two   
76 // states.   
77 method clickLock $( )$ is   
78 if (player.playing)   
79 player.changeState(new PlayingState(player))   
80 else   
81 player.changeState(new ReadyState(player))   
82   
83 method clickPlay $( )$ is   
84 // Locked， so do nothing.   
85   
86 method clickNext $( )$ is   
87 // Locked， so do nothing.   
88   
89 method clickPrevious $( )$ is   
90 // Locked， so do nothing.   
91 // They can also trigger state transitions in th   
92 class ReadyState extends State is   
93 method clickLock $( )$ is   
94 player.changeState(new LockedState(player))   
95   
96 method clickPlay $( )$ is   
97 player.startPlayback $( )$   
98 player.changeState(new PlayingState(player))   
99   
100 method clickNext $( )$ is   
101 player.nextSong()   
102   
103 method clickPrevious $( )$ is   
104 player.previousSong $( )$   
105   
106   
107 class PlayingState extends State is   
108 method clickLock $( )$ is   
109 player.changeState(new LockedState(player))   
110   
111 method clickPlay $( )$ is   
112 player.stopPlayback $( )$   
113 player.changeState(new ReadyState(player))   
114   
115 method clickNext $( )$ is   
116 if (event.doubleclick)   
117 player.nextSong $( )$   
118 else   
119 player.fastForward(5)   
120   
121 method clickPrevious $( )$ is   
122 if (event.doubleclick)   
123 player.previous $( )$   
124 else   
125 player.rewind(5)

# Applicability

Use the State pattern when you have an object that behaves differently depending on its current state, the number of states is enormous,and the state-specific code changes frequently.

The pattern suggests that you extract all state-specific code into a set of distinct classes. As a result, you can add new states or change existing ones independently of each other, reducing the maintenance cost.

Use the pattern when you have a class polluted with massive conditionals that alter how the class behaves according to the current values of the class's fields.

The State patern lets you extract branches of these conditionals into methods of corresponding state classes. While doing so,you can also clean temporary fields and helper methods involved in state-specific code out of your main class.

Use State when you have a lot of duplicate code across similar states and transitions of a condition-based state machine.

The Statepaternletsyoucomposehierarchesofstateclasses and reduce duplication by extracting common code into abstract base classes.

# How to Implement

1.Decide what class will act as the context. It could be an existing class which already has the state-dependent code; or a new class,if the state-specific code is distributed across multiple classes.

2.Declare the state interface. Although it may mirror all the methods declared in the context, aim only for those that may contain state-specific behavior.

3.For every actual state, create a class that derives from the state interface.Then go over the methods of the context and extract all code related to that state into your newly created class.

While moving the code to the state class,you might discover that it depends on private members of the context. There are several workarounds:

。 Make these fields or methods public.   
。 Turn the behavior you're extracting into a public method in the context and callit from the state class. This way is ugly but quick,and you can always fix it later.

。 Nest the state classes into the context class,but only if your programming language supports nesting classes.

4.In the context class,add a reference field of the state interface type and a public setter that allows overriding the value of that field.

5. Go over the method of the context again and replace empty state conditionals with calls to corresponding methods of the state object.

6.To switch the state of the context, create an instance of one of the state classes and pass it to the context. You can do this within the context itself, or in various states, or in the client. Wherever this is done, the class becomes dependent on the concrete state class that it instantiates.

# Pros and Cons

Single Responsibility Principle. Organize the code related to particular states into separate classes.

Open/Closed Principle.Introduce new states without changing existing state classes or the context.

Simplify the code of the context by eliminating bulky state machine conditionals.

XApplying the pattern can be overkillif a state machine has only a few states or rarely changes.

# ← Relations with Other Patterns

Bridge, State, Strategy (and to some degree Adapter) have very similar structures. Indeed,all of these patterns are based on composition,which is delegating Work to other objects. However, they all solve different problems. A pattern isn't just a recipe for structuring your code in a specific way. It can also communicate to other developers the problem the pattern solves.

State can be considered as an extension of Strategy. Both patterns are based on composition: they change the behavior of the context by delegating some work to helper objects. Strategy makes these objects completely independent and unaware of each other. However, State doesn't restrict dependencies between concrete states, letting them alter the state of the context at will.

![](images/a6a4411cd433ee934acdf94d17c4538a18a26e9b2825890975d67ffe6c4b4dc3.jpg)

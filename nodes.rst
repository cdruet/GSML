The declaration of a node is made of several sections:

1. **Parameters** are simply fixed values that are used within the node, such as the maximum output of a process. Yet, paramaters can be time-dependent to reflect for example a fluctuating element such as wind speed.
2. **Variables** are time-varying values that depends upon the interactions among nodes. E.g. the amount of wheat grains that is produced at a particular instant.
3. **Constraints** define the relationships among parameters and variables within the node. For example, how much flour is required to produce one bread, the maximum number of breads (a parameter) that can be produced in the oven that has a limited capacity. Whereas variables are time-dependent, constraints are expressed in relative terms where *t* represents *now* whereas *t-1* is the instant before and *t+1* the instant after.
4. **Objectives** define how the node contributes to the overal objective of the system, whereas minimising total costs or maximizing profits.

The typical structure of a node is the following:

.. literalinclude:: ./examples/node.txt
   :language: text
   :emphasize-lines: 1,2,4,6,8

   
.. _parameter:

Parameters
----------

Parameters can be seen as constant and can take the form of scalar and vectors. 

.. literalinclude:: ./examples/parameters.txt
   :language: text
   :emphasize-lines: 3,4

   
.. _variable:

Variables
---------

Variables are what the solver will "play" with. There are 3 types of variables:

* **Input variables**, which represent what's coming in the node,
* **Output variables**, which represent what's leaving the node,
* **Internal variables**, which are exclusively used within the node and, hence, cannot be linked with any other node, contrary to the two previous types of variables.

Variables are immediately dimensioned to the "size" of the problem at hand. If you want to optimize your system over 24 hours, which will call the *horizon* in the sequel where *hour* in this case will be the *step*, every variable will be a vector of 24 elements.

.. literalinclude:: ./examples/variables.txt
   :language: text
   :emphasize-lines: 5,6,7

   
.. _constraint:

Constraints
-----------

Constraints are describing relationships among variables and parameters. Both inequalities and equalities can be declared.

.. literalinclude:: ./examples/constraints.txt
   :language: text
   :emphasize-lines: 10,11,12,13

   
.. _objective:

Objectives
----------

The objectives define what has to be targeted by the optimiser. Note that when multiple objectives are defined, they are simultaneously dealt with.

.. literalinclude:: ./examples/objectives.txt
   :language: text
   :emphasize-lines: 15


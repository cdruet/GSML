.. _advanced grammar:

****************
Advanced Grammar
****************

Explicitly  writing  all  equations  may seem  exciting  to  some  but
exhausting for the vast majority. To circumvent this, the base grammar is
complemented with a more sophisticated one to shorten modelling.

In the sequel, all the  sophisticated mechanism will be introduced and
translated into basic grammar.

The  following features  have already  been identified  as potentially
useful to facilitate the creation of models.

.. _units:

Units
=====

Making units explicit to make it easier to define and understand models and
avoid the need for converting everything of the same kind in the same units.

Fluxys proposes to define some units, and doing it with two categories of units:

1 “base units” that are the simplest ones:
         - they are defined with a standard name (for example: #UNIT Distance or #UNIT Time)
         - they must contain a (unique) “base reference unit” (a unit not depending on another one)
         - they may contain other units that are ultimately based on the “base reference unit”
         - the compiler will use these unit definitions in order to translate one unit to another

2 “derived units”:
         - they are defined with a standard name followed by “=” and the relation with the units they are based on
           (for example : #UNIT Speed = Distance / Time, and #UNIT Acceleration = Speed / Time)
         - the compiler will ensure that all combination of units do respect the unit integrity
           (for speed, no unit combination allowed excepted those giving ultimately a “Distance” unit divided by a “Time” unit)

The idea is that these units would be mandatory when using the advanced
grammar. Every variable or parameter will have to be linked to a unit with for
example the use of brackets (-> variable[UnitName]). If a variable or
parameter is dimensionless, it will have empty brackets (->
dimensionlessVariable[]). The value for a variable or parameter must have one
of the corresponding units (-> gasSpeed[Speed] = 10 m/s). This will ensure
that every number will have its unit declared explicitly. The compiler will
raise errors if wrong units are used. (-> gasSpeed[Speed] = 10 hour and
gasSpeed[Time] = 10 m/s will both raise an error) Unit conversion will be done
by the compiler based on the units definitions (the multiple of the “base
reference unit” for every unit).
 
 
.. literalinclude:: ./examples/units_ghislain_1.txt
   :language: text

Because units must be declared everywhere, this is also true for the
#TIMESCALE variables. Note that Horizon divided by Step give the size of the
arrays (or matrix) that will be used for the computations. The user does not
need to care about it in the grammar.  The compiler will handle this for him.
 
.. literalinclude:: ./examples/units_ghislain_2.txt
   :language: text

Here is how the PV node could be written with the use of units. You can
directly see that it removes all “conversion factors” (1000, 8760, ...) that
were used in the previous section.

For notation, () reflects that a variable or parameter is an array or matrix
having a (different) value for Step in the Horizon. Without (), a variable or
parameter is considered as constant over the whole Horizon (same value for
each Step). The compiler will handle the conversion of these constants to
arrays if and where needed, it is not done in the grammar.

To minimize errors, the use of numbers or units in the #CONSTRAINTS section IS
NOT allowed. The [t] is optional, the compiler should managed it based on
arrays() or constants, defined in the #PARAMETERS and #VARIABLES parts.

In #OBJECTIVES, names and units should be included in order to explicitly
optimize one of them in a consistent way. (for example, not minimizing cost
and distance or cost and CO2) In the “Remote Hub”, we will have to minimize
the sum of all “cost” objective variables, and these have to be expressed in a
[Cost] unit. (unit integrity, again, will be checked by the compiler)

Numerical problems (1000 vs 1 vs 0.001 depending on unit selected) in the
solver should not be dealt by the user in the grammar. These numerical
problems have to be detected in the compiler or elsewhere. The compiler will
have to raise errors if units are not defined or not consistent.
 
.. literalinclude:: ./examples/units_ghislain_3.txt
   :language: text


Current approach
----------------

Include time to size the variables/parameters and specify the units of it,
possible the commidity at hand.

.. literalinclude:: ./examples/units_christophe_1.txt
   :language: text


Commodities
===========

Commidities enable automatic conversions. They would be expressed as node

.. literalinclude:: ./examples/commodities_ghislain_1.txt
   :language: text


Variables as structures
=======================

Enabling structured variables to increase readability.

Classes
=======

Ability to instantiate and parametrize nodes. E.g. to declare a CCGT class and declare several CCGTs in a system.

Clusters
========

Ability to instantiate and parametrize cluster of nodes. E.g. to declare a country cluster and declare several countries

Sum, Max, Min, Average...
=========================

Ability to use more complex operators. Requires vector variables.

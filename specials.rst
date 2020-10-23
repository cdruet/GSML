There is always a need for expression special things.

Let us imagine a system covering an horizon of 5 years with a step of 1 day (365 days a year). In this system, there is a constraint that changes every year.

.. literalinclude:: ./examples/for_before.txt
   :language: text
   :emphasize-lines: 17-24


Explicitly defining all these contraints is obviously tedious. To facilitate this, the grammar enables the use of *for*, *where* and the *modulo operator*.

For
---

.. literalinclude:: ./examples/for_after.txt
   :language: text
   :emphasize-lines: 10-14


In the triplet *[x:y:z]*:

1. *x* is an integer that represents the starting **index**,

2. *y* is an integer that represents the step, typically 1,

3. *z* is an integer that represents the ending **index**, which is excluded from the set.

Hence, to cover the first year, one should write ``... for t in [0:1:365]`` as it will effectively constraint the variable from index ``0`` to index ``364``.

Where
-----

The same result can be achieve by using the *where* clause.

.. literalinclude:: ./examples/where_after.txt
   :language: text
   :emphasize-lines: 10-14




Modulo operator and integer division
------------------------------------

The same result can be achieve by using the modulo operator *%* or the integer division operator *//*:

.. literalinclude:: ./examples/modulo_after.txt
   :language: text
   :emphasize-lines: 13-14




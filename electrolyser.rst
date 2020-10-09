An electrolyser
---------------

The physical process
^^^^^^^^^^^^^^^^^^^^

To  illustrate this  grammar,  let us  start  with a simple  technology
such as an electrolyser. 

An  electrolyser  transforms  water  into hydrogen  and  oxygen  using
electricity. Electrolysis is  a chemical process which  is governed by
the laws  of physics, i.e. principles  that define how much  water and
electricity are needed  to produce a certain quantity  of hydrogen and
the consequent quantity  of oxygen.

Modelling  this physical/chemical  process  into its  very details  is
difficult.  Using  GSML, the  level  of  modelling details  should  be
adequately choosen to match the  overall modelling  complexity of  the
problem.

To illustrate the grammar, let  us model an electrolysis process. Just
like any other  process, an electrolyser can be described  as a set of
input variables,  a set of  output variables, and links  between these
variables.

.. literalinclude:: ./examples/electrolyser.txt
   :language: text
   
Note that in  the base grammar, units must be  properly handled, which
why  units will  be  explicited  in the  name  of  the parameters  and
variables (it  does have to be  so though). Later in  this tutorial, a
more  sophisticated  way  to  handle  units  will  be  detailled  (see
:ref:`units`).

.. literalinclude:: ./examples/electrolyser.txt
   :language: text
   :emphasize-lines: 3,5,6,7,8
   
In terms  of process, an  electrolyser requires 55 kWh  of electricity
together with  9 l of water  to produce 1 kg  of hydrogen and 8  kg of
oxygen.

.. literalinclude:: ./examples/electrolyser.txt
   :language: text
   :emphasize-lines: 10,11,12

An  electrolyser also  has  physical limitations.   It  has a  maximum
capacity that can be expressed either in terms of electricity consumed
or in terms of hydrogen produced.

.. literalinclude:: ./examples/electrolyser.txt
   :language: text
   :emphasize-lines: 3,13,14

The financial interests
^^^^^^^^^^^^^^^^^^^^^^^

The objective of the operator of  this electrolyser is to maximize its
profits. On the one hand,  maximise its revenues from selling hydrogen
and oxygen, let's say at market price, and on the other hand, minimise
its costs from buying electricity  and (pure) water from its suppliers
(probably at market price too as both are commodities).

Let us assume for  now that the operator has a  fixed contract for its
hydrogen  and  oxygen  and,  hence,  fixed  revenues  from  them.  Its
objective becomes minimising its costs for producing these.

.. literalinclude:: ./examples/electrolyser_objective.txt
   :language: text
   :emphasize-lines: 5,6,18


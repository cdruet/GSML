.. Generic System Modelling Language documentation master file, created by
   sphinx-quickstart on Thu Sep 24 11:53:20 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

#################################################
Generic System Modelling Language's documentation
#################################################

GSML aims  at facilitating  the modelling of  complex systems  using a
pseudo-natural language.  It enables  the users  to focus  on properly
modelling  the   systems  they   target  instead  of   coding  complex
optimisation problems in the appropriate programmation language.

GSML also aims at bridging  gaps accross communities of researchers by
enabling each  and every one  of them to focus  on what they  do best,
whether  modelling  a  system  to  spot  bottlenecks  and  weaknesses,
developing  mathematical   solvers  to  handle   seemingly  unsolvable
non-linear problems or  using multi-agent techniques to  cope with the
complexity of the real world in an *interactive* way.

.. figure:: ./illustrations/power_system.png
   :width: 700px
   :alt: Everything is connected... through the electrical grid(s).
   :align: center

   Everything is connected... through the electrical grid(s)

Using  GSML,  systems are  described  as  directed graphs.  Goods  are
flowing  from where  they are  produced  to where  they are  consumed,
whereas money goes the other way around. 

This  documentation  aims   not  only  at  (i)   presenting  the  GSML
approach,  (ii)  describing  a   **base  grammar**  that  exhaustively
describe systems,  (iii) describing  a more **advanced  grammar** that
shorten and simplify the descriptions, but also (iv) providing tips on
how to model things using this grammar, and illustrating it throughout
the whole documentation to inspire users.

.. toctree::
   :maxdepth: 2

   introduction
   grammar
   modelling
   advanced

##################
Indices and tables
##################

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

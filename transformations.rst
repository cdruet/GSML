Transformations
===============

The basic idea is to represent the system configuration studied using a directed graph. A node can be viewed as an abstraction which is general and expressive enough to represent a broad range of concrete objects and phenomena, such as technologies, physical processes or regulations. Edges then express the relationships between different concrete objects, enabling one to explore a broad class of problem instances. A static framework is first presented, and a multi-period extension is discussed next.

Depending on the objective, the system as described using GBML must be translate into the adequate input for the simulator, solver, etc the user wants to execute.

Linear Programming
------------------

Let :math:`\mathcal{G} = (\mathcal{N}, \mathcal{E})` be a directed graph with node set :math:`\mathcal{N} \subset \mathbb{N}`, :math:`|\mathcal{N}| = N`, and edge set :math:`\mathcal{E} \subset \mathcal{N} \times \mathcal{N}`, :math:`|\mathcal{E}| = E`. Let :math:`A \in \{0, 1\}^{N \times N}` be the (non-necessarily symmetric) adjacency matrix of :math:`\mathcal{G}`. Let :math:`d_n^+ = \sum_{k = 1}^N A_{kn}` and :math:`d_n^- = \sum_{k = 1}^N A_{nk}` be the in-degree and out-degree of :math:`n`, respectively. 

Each node :math:`n \in \mathcal{N}` is equipped with

* a set of variables, which is partitioned into input variables :math:`u_n^+ \in \mathbb{R}^{d_n^+}`, output variables :math:`u_n^- \in \mathbb{R}^{d_n^-}` and internal variables :math:`x_n \in \mathbb{R}^{d_n}`.
* a function :math:`f_n: \mathbb{R}^{(d_n^+ + d_n^- + d_n)} \mapsto \mathbb{R}^{c_n}`, with :math:`c_n` the number of constraints at :math:`n`, along with a set :math:`\mathcal{S}_n \subset \mathbb{R}^{c_n}`, such that constraints can be expressed as :math:`f_n(u_n^+, u_n^-, x_n) \in \mathcal{S}_n`. 
* a function :math:`h_n: \mathbb{R}^{(d_n^+ + d_n^- + d_n)} \mapsto \mathbb{R}^{d_o}`, with :math:`d_o` the number of objectives, such that this function expresses the contribution of :math:`n` to each of those.

Then, let :math:`u_{n, e_i}^+` and :math:`u_{n, e_j}^-` denote the entries of :math:`u_n^+` and :math:`u_n^-` corresponding edges :math:`e_i, e_j \in \mathcal{E}`. Each edge :math:`e = (n, m) \in \mathcal{E}` is also equipped with a function :math:`g_e:\mathbb{R}^2 \mapsto \mathbb{R}`, :math:`g_e(u_{n, e}^-, u_{m, e}^+) = 0` connecting input and output variables of nodes :math:`n` and :math:`m`.

.. admonition:: Example: An electrolyser

    In this framework, a node can readily represent a technology modelled via a static input-output relationship, e.g. an electrolysis plant. Let n = :math:`EL`. The electrolysis process is characterised by two input flows, namely electricity and water, and two output flows, hydrogen and oxygen, thus :math:`d_{EL}^+ = 2` and :math:`d_{EL}^- = 2`. In other words, :math:`u_{EL}^+ \in \mathbb{R}^2` gathers the electricity consumption and the water inflow, while :math:`u_{EL}^- \in \mathbb{R}^2` stores the hydrogen and oxygen outflows, respectively. The capacity of the electrolysis plant can be modelled with an internal variable :math:`x_{EL} \in \mathbb{R}`. Four constraints can be used in order to describe the conversion process (modelled based on a single reference operating point) and the maximum operating capacity of the plant, respectively, i.e. :math:`c_n = 4`. If a linear model is used, :math:`f_{EL}` can be expressed as the affine function









MDP
---

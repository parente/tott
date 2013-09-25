Distribution
============

.. rst-class:: hidden

.. toctree::
    :titlesonly:

    /assignments/final

.. note:: This page is a draft.

:Topics: Build systems, project packaging, code distribution, cloud hosting, Platform as a Service (PaaS)
:Tools: `setup.py`_, `package.json`_, `Gemfile`_, `Cloud Foundry`_

Session #1
----------

... in which we learn to build and package our projects for use by other developers.

:Prep: TODO
:Slides: `Build, Pack, and Ship <../slides/dist_1.html>`_
:Due: :doc:`/assignments/storytime`
:Assigned: :doc:`/assignments/final`

Session #2
----------

... in which we learn to host our projects in the cloud.

:Prep: TODO
:Slides: `Hosting in the Cloud <../slides/dist_2.html>`_
:In Progress: :doc:`/assignments/final`

.. todo::

    * break and put back together an existing makefile for a project to understand how it works
    * automate setup, test, build, local serve of an existing project with a makefile or equiv
    * change the course vagrantfile to start 2 vms, write a fabfile to perform some action on both
    * complete existing setup.py file
    * complete existing package.json file, use interactive package.json tool online
    * find and try equivalent dist file for Ruby (Gemfile)
    * create a dist file for an existing project, possibly one created earlier in the course
    * work through a few license combos to figure out the net license reqs (e.g., LGPL + MIT = ?, GPL + LGPL + BSD = ?,  AGPL + * = ?) (yes, not fun, but this is reality)


.. seealso::

    Paver_
        Python project scripting tool

    Rake_
        Ruby build program

    SaltStack_
        Python-based tool for infrastructure management and automation

    Chef_
        Ruby-based tool for infrastructure management and automation

    Puppet_
        Another Ruby-based tool for infrastructure and automation
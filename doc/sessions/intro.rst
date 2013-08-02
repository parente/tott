Week 1 - Introduction and Setup
===============================

.. note:: This page is a draft.

:Topics: Course overview, virtual development environment setup
:Tools: SublimeText_, `Package Control`_, `Google Chrome`_, VirtualBox_, Vagrant_

Session #1
----------

... in which we understand the purpose of the course, our goal, and how we'll get there, plus play with a few tools.

:Prep: None
:Slides: `Introduction <../slides/intro_1.html>`_
:Assigned: :doc:`/assignments/setup`

Exercises
~~~~~~~~~

* Begin following the instructions for assignment #0 to setup the course tools on your laptop. This assignment is due next week, but it will require some time to execute all the steps. Plus you can't do much until you've worked through it.
* If you've installed SublimeText and need a break from following rote instructions, try the following:

    * Copy/pasting from TODO into a new text document and replace all instances of the word "Sally" with "Shelly" using multi-caret selection.
    * Create a new project, add multiple files to it, and save it off. Reopen it.
    * Split the editor window into multiple panes. Open TODO and TODO side by side. Can you figure out what they are?
    * Use Package Control to find and install another useful tool.


Session #2
----------

in which we realize the benefits of a virtual development environment and practice managing one using Vagrant.

:Prep: TODO
:Slides: `Virtual Dev <../slides/intro_2.html>`_
:In Progress: :doc:`/assignments/setup`

Exercises
~~~~~~~~~

* Continue with assignment #0 if you have not yet run *tottbox* successfully.
* Use git to clone the etherpad-lite project on GitHub. Figure out how to run it with the default settings (hint: find the docs). Figure out what it does and how another classmate can access it to try it with you.
* Modify the Vagrant file to mount a second directory shared between your host box and *tottbox*. Use the NodeJS package manager to install `http-server`. Start it running. Visit the port on localhost. What do you see?

Introduction and Setup
======================

.. rst-class:: hidden

.. toctree::
  :titlesonly:

  /assignments/setup

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

These are exercises you should perform in class today. Items you *must* complete today are marked with a |star|. The rest are roughly ordered by increasing difficulty. Work on them in whatever order you wish. You do not have to complete them all.  If you finish everything early, work on the assignment, read ahead, or talk with me about what else you might do.

Prep for the course
###################

|star| Create a Google+ account so I can add you to our `TotT Google+ community <TotT community>`_. Tell me the email address associated with your account before you leave today.

Review the course syllabus and schedule so you have an idea about how the course will run. Ask questions.

Prepare your laptop
###################

Begin following the assignment instructions to setup the course tools on your laptop. This assignment is due next week, but it will require some time to execute all the steps. Plus, you can't do much else in this course until you've worked through it.

Experiment with SublimeText
###########################

If you've installed SublimeText per the assignment, and need a break from following rote instructions, try the following:

* Copy/paste from `sally.txt <https://gist.github.com/parente/6171058>`_ into a new text document and replace all instances of the word "Sally" with "Shelly" using multi-caret selection. (Hint: Google for multi-caret selections in SublimeText.)

* Create a new project, add multiple files to it, and save it off. Reopen it.

* Split the editor window into multiple panes. Open `readme.feature <https://bitbucket.org/unctott/assignment_0/raw/315847b9423986835e53d4e11bc86b1eedfbae12/features/readme.feature>`_ and `readme.py <https://bitbucket.org/unctott/assignment_0/src/315847b9423986835e53d4e11bc86b1eedfbae12/features/steps/readme.py?at=master>`_ side by side. Can you figure out what they are?

* Use Package Control to find and install another useful SublimeText tool. Share some information about it in the `TotT community`_.

Session #2
----------

... in which we realize the benefits of a virtual development environment and practice managing one using Vagrant.

:Prep: Read `Hardware virtualization <http://en.wikipedia.org/wiki/Hardware_virtualization>`_ and `How Vagrant Benefits You <http://docs.vagrantup.com/v2/why-vagrant/index.html>`_ (~10 minutes), then watch the `TotT Virtual Machines screencast <https://www.youtube.com/watch?v=W15ZNZFc9BY>`_ (~23 minutes).
:Slides: `Virtual Machines <../slides/intro_2.html>`_
:In Progress: :doc:`/assignments/setup`

Exercises
~~~~~~~~~

Continue with the setup assignment if you have not yet run *tottbox* successfully. If you have, create a `new gist (or gists) on GitHub <https://gist.github.com/>`_ to document your work on the in-class exercises below. Later, share a summary of what you learned and a link to your gist in the `TotT community`_.

Practice Vagrant commands
#########################

Run ``vagrant --help`` to get a list of commands it supports. Try running the following against the Vagrantfile for *tottbox*, not necessarily in this order: reload, halt, suspend, resume, destroy, up. Remember to document what you find in the gist.

Explain Vagrant networks
########################

Use the NodeJS package manager to install the ``http-server`` package globally on *tottbox*. (Hint: ``npm`` is preinstalled on the VM. Run it with ``--help`` and or Google for help.) Change directories to ``/vagrant`` and start ``http-server`` running in there. Visit http://192.168.33.10:8080/ in your web browser. What do you see? What does `http-server` do? What is 192.168.33.10? Doc what you learn.

Explain Vagrant ports
#####################

Modify the course Vagrantfile to forward port 8080 on *tottbox* to port 8080 on your host box, *localhost*. (Hint: find the Vagrant documentation about config files. It's a one liner.) With the ``http-server`` still running from the last step, visit http://localhost:8080/ in your browser. What do you see? Write it up.

Try simple provisioning
#######################

Modify the course Vagrantfile so that it automatically installs ``http-server`` when you run ``vagrant up``. Note and share how you achieve it.
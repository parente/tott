Vagrant and VirtualBox
======================

Goals
-----

* Setup our shared development environment
* Realize the benefits of a virtual development environment
* Practice managing a dev environment using Vagrant

Prep Materials
--------------

* Read `Hardware virtualization <http://en.wikipedia.org/wiki/Hardware_virtualization>`_ (~10 minutes)
* Read `How Vagrant Benefits You <http://docs.vagrantup.com/v2/why-vagrant/index.html>`_ (~5 minutes)
* Watch `TotT Virtual Machines screencast <https://www.youtube.com/watch?v=W15ZNZFc9BY>`_ (~23 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* to perform all of today's exercises using the ``vagrant ssh`` command you used in the setup instructions. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Practice Vagrant commands
#########################

Run ``vagrant --help`` to get a list of commands it supports. Try running the following against the Vagrantfile for *tottbox*, not necessarily in this order: reload, halt, suspend, resume, destroy, up. Remember to document what you find in the gist.

Explain Vagrant networks
########################

Use the NodeJS package manager to install the ``http-server`` package globally on *tottbox*. (Hint: ``npm`` is preinstalled on the VM. Run it with ``--help`` and/or Google for help.) Change directories to ``/vagrant`` and start ``http-server`` running in there. Visit http://192.168.33.10:8080/ in your web browser. What do you see? What does `http-server` do? What is 192.168.33.10? Doc what you learn.

Explain Vagrant ports
#####################

Modify the course Vagrantfile to forward port 8080 on *tottbox* to port 8080 on your host box, *localhost*. (Hint: find the Vagrant documentation about config files. It's a one liner.) With the ``http-server`` still running from the last step, visit http://localhost:8080/ in your browser. What do you see? Write it up.

Try simple provisioning
#######################

Modify the course Vagrantfile so that it automatically installs ``http-server`` when you run ``vagrant up``. Note and share how you achieve it.
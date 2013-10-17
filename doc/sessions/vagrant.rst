Vagrant
=======

Goals
-----

* :doc:`Setup our shared development environment </setup>`
* Realize the benefits of a virtual development environment
* Practice managing a dev environment using Vagrant

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Read `Hardware virtualization <http://en.wikipedia.org/wiki/Hardware_virtualization>`_ (~10 minutes)
* Read `How Vagrant Benefits You <http://docs.vagrantup.com/v2/why-vagrant/index.html>`_ (~5 minutes)
* Watch the `TotT Vagrant slidecast <../_static/casts/vagrant.html>`_ (~20 minutes) which includes a live demo of:

  * `Vagrant basics <../_static/casts/vagrant.html#/9>`_ (~10 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Practice Vagrant commands
#########################

Run ``vagrant --help`` to get a list of commands it supports. Try running the following against the Vagrantfile for *tottbox*, not necessarily in this order: reload, halt, suspend, resume, destroy, up. Remember to document what you find in the gist.

Explain Vagrant networks
########################

Use the NodeJS package manager to install the ``http-server`` package globally on *tottbox*. (Hint: ``npm`` is preinstalled on the VM. Run it with ``--help`` and/or Google for help.) Change directories to ``/vagrant`` and start ``http-server`` running in there. Visit http://192.168.33.10:8080/ in your web browser. What do you see? What does `http-server` do? What is 192.168.33.10? Doc what you learn.

Explain Vagrant ports
#####################

Modify the *tottbox* Vagrantfile to forward port 8080 on *tottbox* to port 8080 on your host box, *localhost*. (Hint: find the Vagrant documentation about config files. It's a one liner.) With the ``http-server`` still running from the last step, visit http://localhost:8080/ in your browser. What do you see? Write it up.

Try simple provisioning
#######################

Modify the *tottbox* Vagrantfile so that it automatically installs ``http-server`` when you run ``vagrant up``. Note and share how you achieve it.

"Up" multiple boxes
###################

Vagrant can manage and configure multiple boxes from a single Vagrantfile. This feature is handy when you want to simulate a true production deployment, say, where your database runs on one machine, your web server on another, and your job queue on yet another.

Try modifying the *tottbox* Vagrantfile to start and configure a second instance of the *tottbox* image. Share your resulting Vagrantfile in a gist.

Try complex provisioning
########################

`Puppet`_, `Chef`_, `Ansible`_, and `SaltStack`_ are all popular orchestration packages used to configure and manage virtual machines, typically on a large scale. Vagrant ships with plug-ins supporting software provisioning using most of these tools.

Configure one or more of these popular provisioners to install `MongoDB`_ on ``vagrant up``. What does it take? Why might you use these more advanced tools over simple bash scripts? Document what you find.

References
----------

VirtualBox_
    VirtualBox hypervisor homepage

`Vagrant Documentation <http://docs.vagrantup.com/v2/>`_
    Documentation about the command line tools, builders, providers, configuration, etc.

`Virtual machine <http://en.wikipedia.org/wiki/Virtual_machine>`_
    Wikipedia article defining *virtual machine* and how their general implementation

`Vagrantbox.es <http://www.vagrantbox.es/>`_
    A list of base boxes for Vagrant

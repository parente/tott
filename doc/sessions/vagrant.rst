Virtualization and Vagrant
==========================

Goals
-----

* :doc:`Setup our shared development environment </setup>`
* Realize the benefits of a virtual development environment
* Practice managing a dev environment using Vagrant_

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Read `Hardware virtualization <http://en.wikipedia.org/wiki/Hardware_virtualization>`_ (~10 minutes)
* Read `How Vagrant Benefits You <http://docs.vagrantup.com/v2/why-vagrant/index.html>`_ (~5 minutes)
* Watch the `TotT Vagrant slidecast <../_static/casts/vagrant.html>`_ (~20 minutes) which includes a live demo of:

  * `Vagrant basics <../_static/casts/vagrant.html#/9>`_ (~10 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. 

Take notes in Gist
##################

GitHub runs a service called `Gist <https://gist.github.com/>`_. It's useful for storing versioned, plain text files and sharing them online.

As you tackle the exercises in this session, and many others in our meetups, you should post your solutions in gists. I encourage you to share them in our `TotT community`_ so you can learn from one another. At the very least, if they're online somewhere, you can always point to them as work you've done or refer to them later as examples.

Vist the Gist site now and play with it for a few minutes to get familiar with it.

Practice Vagrant commands
#########################

On your host machine, open a new terminal window. Change to the ``tott_dir`` folder you created when you set up *tottbox*, the one containing the Vagrantfile you downloaded. For example, if you used my suggested defaults, you would type the following:

* Windows: ``cd \Users\your_username\projects\tott``
* Mac/Linux: ``cd ~/projects/tott``

(Hint: After typing a few characters, press the Tab key on your keyboard liberally. The terminal should autocomplete what you are typing. Press it multiple times to cycle through multiple matches.)

Once you're in the proper directory in the terminal, run ``vagrant --help`` to get a list of commands it supports. Try using the following against the Vagrantfile for *tottbox*, not necessarily in this order: 

* ``vagrant reload`` 
* ``vagrant halt``
* ``vagrant suspend``
* ``vagrant resume``
* ``vagrant destroy``
* ``vagrant up``

What does each do? Document what you find in a gist.

SSH into *tottbox*
##################

After you finish playing with Vagrant, bring up a new *tottbox* instance and use SSH to connect to it. Refer to the setup instructions for a reminder of how to do it.

Explore Virtualbox
##################

Vagrant hides much of the complexity of working with a virtual machine (VM). However, it's good to understand a bit more about what's happening under the covers.

Run the Virtualbox desktop application on your machine. Find the *tottbox* instance in the list on the left. Right click it and choose Settings. Poke around in the dialog that appears and try to answer these questions.

* How many processors does *tottbox* have?
* How much RAM does it have?
* How disk space?
* What folders are shared with the VM?

Can Vagrant change any of these? (Hint: Look in the Vagrant documentation.)

Explain Vagrant networks
########################

NodeJS is a runtime environment for the JavaScript programming language. (It's OK if you don't know JavaScript yet.) The NodeJS package manager lets you install libraries and utilities for your JavaScript programs.

Use the NodeJS package manager to install the ``http-server`` package globally on *tottbox*. (Hint: ``npm`` is preinstalled on the VM. Run ``npm --help`` and/or Google for help on using it.) 

Once you have it installed, change directories to ``/vagrant``  and start ``http-server`` running in there. Visit http://192.168.33.10:8080/ in your web browser. What do you see? What does `http-server` do? What is 192.168.33.10? Doc what you learn.

Explain Vagrant ports
#####################

Modify the *tottbox* Vagrantfile to forward port 8080 on *tottbox* to port 8080 on your host box, *localhost*. (Hint: Find the Vagrant documentation about config files. It's a one liner.) 

After you make the change, destroy the *tottbox* instance and bring up a new one for the change to take effect. (For bonus points: figure out the magic Vagrant command that updates the *tottbox* configuration without destroying the running instance completely.)

Install and run the ``http-server`` NPM package again. Now visit http://localhost:8080/ in your browser. What do you see? Why? Write it up.

Try simple provisioning
#######################

Modify the *tottbox* Vagrantfile so that it automatically installs ``http-server`` when you run ``vagrant up``. Note and share how you achieve it. (Hint: You need to include something like the commands you've been typing at the prompt in the Vagrantfile somewhere.)

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

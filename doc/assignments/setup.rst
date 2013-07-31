Assignment #0 - Setup
=====================

.. note:: This page is a draft.

In this assignment, you will prepare to use the numerous tools outlined in the course schedule. You will read this page and follow its instructions, step-by-step, figuring out a few details along the way. At the end, you will follow a verification procedure that will ensure you have a working development environment. The final check will "submit" this assignment so that I know you have completed it.

At a glance, you will configure all of the following:

#. SublimeText_ or an equivalent programmer's text editor
#. `Package Control`_ for SublimeText and some useful extensions
#. `Google Chrome`_ for web development
#. *tottbox*, an Ubuntu virtual machine (VM) prepared to run all of our tools
#. VirtualBox_ to run *tottbox*
#. Vagrant_ to control *tottbox*
#. Git_ for version control throughout the course
#. BitBucket_ and GitHub_ accounts for code backup, collaboration, and submission

Some of the steps will vary depending on your operating system (e.g., Windows, Mac, Linux). Make sure you follow the appropriate instructions.

SublimeText
-----------

SublimeText 2 is a cross-platform programmer's text editor with a powerful extension system. To get a sense of what it can do, visit http://www.sublimetext.com/, watch the animation on the front page, and read some of the features further down the page. While I will not go so far as to require you to use a particular editor in this course, I highly recommend it. I've been through Emacs, Eclipse, TextMate, and others: I've been the most productive with Sublime.

#. Visit the SublimeText home page.
#. Click the download link for your operating system below the animation or visit the Download tab.
#. Install SublimeText.

   * Windows: Double-click the downloaded installer and follows its instructions.
   * Mac: Double-click the downloaded disk image and drag SublimeText to your Applications folder.
   * Linux: ``tar xjf Sublime*.bz2`` and make sure the ``sublime_text`` executable is in your ``$PATH``.

#. Run SublimeText.

   * Windows: Click the SublimeText icon in the Start menu.
   * Mac: Double click the SublimeText icon in your Applications folder.
   * Linux: Run ``sublime_text`` in a terminal in your desktop environment.

Take a few minutes to try some of the features noted on the SublimeText home page before continuing. Pay extra attention to the Goto Anything and Command Palette features.

Package Control
~~~~~~~~~~~~~~~

`Package Control`_ is an extension for SublimeText that lets you easily install a host of additional extensions from within Sublime.

#. Visit the Package Control home page.
#. Click the Installation tab.
#. Follow the instructions to install Package Control for the version of SublimeText you installed.

Once you have Package Control installed, do the following to install some extensions that will benefit you in this course.

#. Press Ctrl-Shift-P (Windows/Linux) or Cmd-Shift-P (Mac) to open the SublimeText Command Palette.
#. Start typing *install* until Package Control: Install Package is the selected item.
#. Press Enter.
#. Start typing *GitGutter* until that package is selected.
#. Press Enter to install it.

Voila. You've installed a package that can show you which lines in your code you've changed since you last committed your code to version control. (If the last sentence was gibberish, don't fret. We're going to cover version control with git and these extensions will make a lot more sense in context.)

Repeat the procedure you just followed to install GitGutter for the following additional packages:

* SublimeLinter
* SidebarEnhancements
* HTML5

After installing these, take a few minutes to browse the `Package Control community repository <http://wbond.net/sublime_packages/community>`_ to get a sense of the tools available.

Google Chrome
-------------

The desktop browser scene is not as messy as it was some years back. The big browser vendors are largely converging on a common feature set defined by HTML5, CSS3, and so on. Firefox_, Safari_, `Google Chrome`_, `Opera`, and even recent versions of `Internet Explorer`_ are all fine for browsing the web. Most are pretty good for web development too. In this course, you will practice using the Google Chrome Developer Tools.

#. If you do not already have Chrome installed, download it from its Google home page.
#. Follow the instructions that appear one you accept the license agreement to get it installed.
#. Run Chrome.

   * Windows: Click the Chrome icon in the Start menu.
   * Mac: Double click the Chrome icon in your Applications folder.
   * Linux: Run ``chrome`` in a terminal in your desktop environment.

Chrome will prompt you to create or login to a Google Account. You do not need to do so for the purposes of this course, but can if you wish.

VirtualBox
----------

VirtualBox_ is an open source virtualizer, an application that can run entire operating systems within their own virtual machines. For instance, you can create a virtual machine running Ubuntu Linux and bring up that machine right on your Windows 7 desktop. There are `many interesting uses and advantages of virtual machines <http://en.wikipedia.org/wiki/Virtualization>`_, two of which we'll heavily benefit from in this course:

1. A common, consistent environment for running code and tools
2. The ability to "reset-to-zero" at any time

Do the following to install VirtualBox.

#. Visit the VirtualBox home page.
#. Click the Downloads link.
#. Download the installer matching your laptop operating system under *Virtualbox platform packages*.
#. Run the installer, choosing all of the default options.

   * Windows: Grant the installer access every time you receive a security prompt.
   * Mac: Enter your admin password.
   * Linux: Enter your root password if prompted.

#. Reboot your laptop if prompted to do so when installation completes.
#. Close the VirtualBox window if it pops up at the end of the install.

Vagrant
-------

Vagrant_ is an open source command line utility for managing reproducible developer environments. While we could use the VirtualBox GUI to juggle virtual machines, their settings, and their distribution, Vagrant hides the complexity as you'll see in the next section.

First, however, you need to install Vagrant.

#. Visit the Vagrant home page.
#. Click the Download link.
#. Choose the latest version of Vagrant at the top of the list.
#. Download the installer for your platform.
#. Run the installer, choosing all defaults.
#. Reboot your laptop if prompted to do so when installation completes.

SSH for Windows Users
~~~~~~~~~~~~~~~~~~~~~

If you are running Windows on your laptop and have not installed Cygwin_ or the like, you'll need to perform a few additional steps before Vagrant will be useful to you. Namely, you need to get a SSH, secure shell, client in order to connect to the virtual machine running on your laptop.

Installing Cygwin just to get SSH is overkill for this course A lower-overhead solution is  to install git_ for Windows. This Windows installer includes a few common Unix command line utilities including the necessary ``ssh``.

#. Visit http://git-scm.com/download/win.
#. If the installer does not download automatically, click to download it.
#. Run the installer.

   * Choose the defaults **until prompted about adjusting your PATH.**.
   * Pick *Run Git and included Unix tools from the Windows Command Prompt*.
   * Continue choosing defaults until the installer completes.

tottbox
-------

With VirtualBox and Vagrant installed, you're now ready to bring up the virtual machine running Ubuntu Linux Server 12.04 we'll be using throughout the course, affectionally named *tottbox*. This VM already has most of the tools we will explore pre-installed pre-configured, and ready-for-use.

.. note:: To make it clear where we are running commands, from now on we will call the operating system running on your laptop the *host box* and the virtual machine *tottbox*.

#. Create a folder that will serve as the container for all of your work in this course. Some suggestions:

   * Windows: ``C:\Users\your_username\projects\tott``
   * Mac/Linux: ``~/projects/tott``

#. Download `the course Vagrantfile <https://raw.github.com/parente/tott/master/vagrant/Vagrantfile>`_, a config that tells Vagrant how to run *tottbox*.
#. Put the Vagrantfile you just downloaded into the folder you just created. We'll call this the course folder from now on.
#. Open a terminal window.

   * Windows: In the Start Menu, search for and run the Command Prompt application (cmd.exe). If you have Cygwin installed, you can run the Cygwin Bash Shell instead.
   * Mac: Run Terminal in the Applications folder.
   * Linux: You know what to do.

#. Navigate to the folder containing the Vagrant file.

   * Windows: ``cd \Users\your_username\projects\tott``
   * Mac/Linux: ``cd ~/projects/tott``

#. Pause here until you have a stable Internet connection and time to leave your laptop downloading the *tottbox* virtual machine image (~700 MB).
#. Enter the following command: ``vagrant up``.

   * Vagrant will download the *tottbox* virtual machine image for safe keeping.
   * It will make a copy of the image in the folder you created.
   * It will launch and configure an instance of the virtual machine.
   * After some log messages and scary looking (but OK!) text, Vagrant returns you to the command prompt.

#. Type ``vagrant ssh``.
#. After a moment, you should land at a prompt like ``vagrant@tottbox:~$``.

You are now in a shell running on your copy of *tottbox*. Leave this shell open for the remainder of the steps in this assignment. If you close your laptop or reboot it, you can reconnect to *tottbox* by opening a terminal, returning to course folder you created, typing ``vagrant up``, and then ``vagrant ssh``.

If you want to explore, feel free. Anything you do on the VM filesystem is temporary. You can reset your *tottbox* at any time by running ``vagrant destroy`` followed by ``vagrant up`` on your host box.

.. note:: There is one exception to the reset rule: the ``/vagrant`` directory on *tottbox* is a synchronized mirror of the course folder in which you ran ``vagrant up`` on your host box. Anything you do in ``/vagrant`` on the VM will also happen in the corresponding folder on your host box. Likewise, anything you do in the course folder on your host box will appear in the ``/vagrant`` folder on *tottbox*. **This feature is critical**: it will allow us to edit code and view web apps in our desktop environment, but run them in the stable *tottbox* environment.

git
---

Git_ is an open source, fast, modern `distributed version control system <http://en.wikipedia.org/wiki/Distributed_revision_control>`_. Many high-profile projects have adopted Git for version control, and, according to the GitHub stats quoted on the front page of this site, many more are starting life in Git. We will practice using Git in almost everything we do in this course.

Right now, you just need to tell Git who you are before we proceed. In the *tottbox* terminal, enter the following commands, replacing my fullname and email address with your own.

.. code-block:: console

   git config -f /vagrant/.gitconfig user.name "Peter Parente"
   git config -f /vagrant/.gitconfig user.email "parente@cs.unc.edu"

This information will appear on all code changes you make. Make sure it is accurate.

BitBucket and GitHub
--------------------

GitHub_ and BitBucket_ are two sites offering version control as a service. While GitHub is by far and away the most popular site for social coding, BitBucket offers unlimited private repositories to users with academic email addresses (i.e., you). You will use BitBucket to version and submit your homework solutions in private throughout the course. You will also use GitHub to pull sample code and lab materials.

#. Visit the BitBucket home page.
#. Create an account using your unversity email address (e.g., *email.unc.edu*, *cs.unc.edu*, something that ends in *.edu*).
#. Confirm your account by clicking the link Atlassian sends you in your email.

At this point you've got a BitBucket account, but no way to push code to it for version control. To finish the setup, you need to create a public-key pair. You will store the public half of the key on BitBucket and keep the private half local for use in your *tottbox*.

#. Login and click your user icon in the top right corner.
#. Select Manage account.
#. Enter your first and last name at least if they do not appear.
#. Click SSH keys on the left.
#. Click the Add key button.
#. Enter *tottbox public key* in the Label field.
#. Switch to your *tottbox* terminal and enter the following commands.

   .. code-block:: console

      mkdir -p /vagrant/.ssh
      cd /vagrant/.ssh
      ssh-keygen -f /vagrant/.ssh/bitbucket

8. When prompted, enter a password of your choosing to protect the key pair.
#. Run ``less bitbucket.pub``.
#. Copy the entire output, the public key, to the clipboard.
#. Back on the BitBucket site, paste the entire output into the Key field.
#. Click Add key.

Your BitBucket account is now ready for use. We'll test it in a few minutes to confirm everything is configured. But first, you should get a GitHub account and configure it in the same manner.

#. Visit the GitHub home page.
#. Click Sign up for GitHub.
#. Enter the required information.
#. Click the Account settings (tools icon) in the top right.
#. Enter your first and last name at least.
#. Click SSH keys on the left.
#. Click Add SSH key.
#. Enter *tottbox public key* in the Label field.
#. Switch to your *tottbox* terminal and enter the following commands. **NOTE** that the last command now says *github* instead of *bitbucket*.

   .. code-block:: console

      mkdir -p /vagrant/.ssh
      cd /vagrant/.ssh
      ssh-keygen -f /vagrant/.ssh/github

#. Complete the setup following the same steps you did for BitBucket.

When all is said and done, your ``/vagrant`` directory on your *tottbox* and the course folder on your host box should look something like:

.. code-block:: console

   vagrant
   ├── .gitconfig
   ├── .ssh
   │   ├── bitbucket
   │   ├── bitbucket.pub
   │   ├── github
   │   └── github.pub
   └── Vagrantfile

.. note::

   Typically, keypairs live in a ``.ssh`` directory in your home folder. We deviate from the norm here because we want our keys to continue to exist even if we destroy and recreate *tottbox*. So, instead, we store the keys in the ``/vagrant`` folder which keeps them safely synced on our host box.

   Vagrant does support `agent forwarding <http://docs.vagrantup.com/v2/vagrantfile/ssh_settings.html>`_ which would allow us to store the keys more securely on our host box. Setting up forwarding is a bit of a pain on some OSes, however, so we'll stick with the sync'ed folder approach in this course.

Verification
------------

We'll now run a quick test of your environment. We won't test everything, but we will at least kick the tires.

By following these steps, you'll fork the repository I created on BitBucket for this assignment, hook your fork to our class assignment submission system, clone the repository locally, fill in a little README text file template with some basic information, commit your changes the repository, and push the changes back up to BitBucket.

.. note:: Again, don't let the jargon scare you: we're going to get lots of practice using git for version control and cover all of these terms. If you want to jumpstart your understanding, start reading the first two chapters of the `Pro Git`_ book and playing with git on ``tottbox``.

Create
~~~~~~

#. Visit BitBucket_ and login.
#. Visit https://bitbucket.org/unctott/assignment_0.
#. Click the Fork button.
#. On the dashboard page, click Create repository (or Create, or Create a repository).
#. Enter *assignment_0* for the repository name.
#. Make sure the repository is private and is a Git repository.
#. Click Create repository.
#. Keep the name *assignment_0*, check the private repository box, and uncheck the permissions box.
#. Click Fork repository.
#. After the fork completes, click the gear icon (right-side).
#. Click Access management.
#. Enter username *peter_parente*, select Read access, and click Add.
#. Click Services on the left.
#. Select POST from the drop down and click Add service.
#. Enter TODO in the URL box and click Save.

Clone
~~~~~

#. In the *tottbox* terminal, type ``exit`` to terminate the SSH connection to the ``tottbox``.
#. Destroy, rebuild, and then connect to your *tottbox* by running the following commands in the course folder on your host box.

   .. code-block:: console

      vagrant destroy
      vagrant up
      vagrant ssh

#. Run ``vagrant ssh`` to access the clean *tottbox*.
#. Enter the passphrases you assigned to the BitBucket and GitHub keys you created when prompted.
#. Clone the *assignment_0* repository you forked from me with the following commands, replacing ``your_username`` with your BitBucket username.

   .. code-block:: console

      cd /vagrant
      git clone ssh://git@bitbucket.org/your_username/assignment_0.git

Edit, Commit and Push
~~~~~~~~~~~~~~~~~~~~~

#. Open SublimeText on your host box.
#. Use it to open the README.md file in the ``assignment_0`` directory git created in the course folder.

   * On Windows, if you followed my course folder suggestion, it's in ``\Users\your_username\projects\tott\assignment_0\README.md``
   * On Mac/Linux, if you followed my course folder suggestion, it's in ``~/projects/tott/assignment_0/README.md``.

#. Review the contents of the README.md file.
#. Replace the information about me with the equivalent information about you.

   * If you're using SublimeText and have installed GitGutter, you should see little markers in the left gutter of the editor when you save. These are the lines you've modified in comparison with the latest copy of the README in version control.

#. In the *tottbox* terminal, run the following commands to commit your changes to your local git repository and then push them to the copy of your repository on BitBucket.

   .. code-block:: console

      cd /vagrant/assignment_0
      git commit -a -m "Replaced user info in README"
      git push origin master

#. Visit your BitBucket dashboard again.
#. Confirm that the front page of your dashboard shows the README with the changes you just made.

Tag and Release
~~~~~~~~~~~~~~~

#. Back in *tottbox*, run these final commands to tag your changes as a *v1* (version #1) assignment submission.

   .. code-block:: console

      git tag -a v1
      git push origin v1

   .. todo:: where to look for results of submission test run? email?

#. Celebrate. You've submitted your assignment.

What Happened?
~~~~~~~~~~~~~~

You might wonder what just happened behind the scenes. Here's the gist.

* You created a read-write copy of the read-only *peter_parente/assignment_0* git repository on BitBucket, called a fork.
* You made a read-write clone of your fork in your course folder for local editing on your laptop.
* You committed your edits to the README in your local clone of the repository using git on the *tottbox* virtual machine.
* You pushed the commit from your local clone up to the repository on BitBucket.
* After confirming the edits, you tagged the commit as a release and pushed that tag to BitBucket as well.
* Each time you pushed, BitBucket contacted URL you configured in your fork of the repository.
* A little web service I wrote received the BitBucket request and scanned it for a release tag.
* When the web service saw your tag, it spawned a fresh *tottbox* virtual machine, cloned your repository, switched to the tagged commit, and ran a test suite on the contents.
* The test runner spat out a report which it then emailed to you.

Voila. Automated, stable, test-driven assignment submission, feedback, and grading. We'll be using this scheme throughout the course and will review it in more detail in the next assignment.

Going Further
-------------

You just setup a virtually indestructable development environment on your laptop with numerous interesting, useful tools pre-installed. Play with it. Break it. Put it back together. Read more about the pieces. And, for now, just have fun.
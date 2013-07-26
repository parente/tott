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
#. `GitHub` and `BitBucket`_ accounts for code collaboration and submission

Some of the steps will vary depending on your operating system (e.g., Windows, Mac, Linux). Make sure you follow the appropriate instructions.

SublimeText
-----------

SublimeText 2 is a cross-platform programmer's text editor with a powerful extension system. To get a sense of what it can do, visit http://www.sublimetext.com/, watch the animation on the front page, and read some of the features further down the page. While I will not go so far as to require you to use a particular editor in this course, I highly recommend it. I've been through Emacs, Eclipse, TextMate, and others: Sublime and its extension ecosystem have improved my productivity the most.

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

`Package Control`_ is an extension for SublimeText that lets you easily install a host of additional extensions, right from within Sublime.

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

Vagrant
-------

tottbox
-------


.. todo:: need vagrant up first to gen keys in a consistent manner

GitHub and BitBucket
--------------------

GitHub_ and BitBucket_ are two sites offering version control as a service. While GitHub is by far and away the most popular site for social coding, BitBucket offers unlimited private repositories to users with academic email addresses (i.e., you). You will use BitBucket to version and submit your homework solutions in private throughout the course. You will also use GitHub to pull sample code and lab materials. In both cases, you will be using and learning git, a free, fast, modern distributed version control system.

Start by getting an account on BitBucket.

#. Visit the BitBucket home page.
#. Create an account using your unversity email address (e.g., *email.unc.edu*, *cs.unc.edu*, something that ends in *.edu*).
#. Confirm your account by clicking the link Atlassian sends you in your email.
#. Login and click your user icon in the top right corner.
#. Select Manage account.
#. Enter your first and last name at least if they do not appear.
#. Click SSH keys on the left.

.. todo: key gen, what on windows?

Verification
------------
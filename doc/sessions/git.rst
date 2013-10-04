Git and GitHub
==============

Goals
-----

* Know what version control is
* Realize the benefits of distributed version control
* Know the basics of using `git`_ at the command line
* Practice a personal Git workflow
* Practice a collaborative Git workflow

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Read `Why Should I Use Source Control? <http://whyshouldiuse.com/source-control>`_
* Read `Pro Git Chapter 1, Sections 1.1 through 1.3 <http://git-scm.com/book>`_
* Read the highly opinionated `Why Git is Better Than X <http://thkoch2001.github.io/whygitisbetter/#git-is-standard>`_
* Watch the TotT Git Basics screencast (~30 minutes)

* Read `Pro Git Chapter 5 Section 5.1 <http://git-scm.com/book/en/Distributed-Git-Distributed-Workflows>`_
* Read `Pro Git Chapter 5 Section 5.2 <http://git-scm.com/book/en/Distributed-Git-Contributing-to-a-Project>`_
* Watch the TotT Git Collaboration screencast (~28 minutes).

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Immerse yourself
################

Visit the `Git Immersion <http://gitimmersion.com/>`_ web site. Starting on `lab #3 <http://gitimmersion.com/lab_03.html>`_, complete all the labs up through #28, skipping #22 and #23. The labs will take you through cloning, staging, committing, branching, and merging in a practice Ruby project. It will also teach you some handy commands supporting a typical git workflow.

You should perform all the lab exercises in a subfolder under ``/vagrant`` on *tottbox*. For instance, ``/vagrant/version/git_immersion`` or similar will work. Remember, this directory also appears on your laptop in the folder you setup for your course work in the first assignment. Feel free to use SublimeText or your preferred text editor to create and edit the files in the tutorials, but execute the git commands in a *tottbox* terminal.

.. note:: Don't worry about the Ruby code. It's there to help you practice Git, not learn Ruby. We'll cover Ruby later in the course.

Diagram git
###########

Draw a little diagram of your interactions with git in the Git Immersion tutorial so far. What effect do your commands have on your working directory, the stage, the master branch, and other branches?

Use plain text to create the diagram or an online tool like `actdiag <http://interactive.blockdiag.com/actdiag/>`_.

Continue the Immersion
######################

Visit the `Git Immersion <http://gitimmersion.com/>`_ web site again. Start on `lab #29 <http://gitimmersion.com/lab_29.html>`_ and work through lab #49. These labs will take you through branching, merging, pulling, and pushing.

Push to GitHub
#################

.. todo: update for github

Clone the `unctott/ex_class_roster <https://bitbucket.org/unctott/ex_class_roster/>`_ repository. Add your BitBucket username to the README according to the instructions in that file. Commit and push the changes back to BitBucket. If you have a conflict, resolve it without losing any names in the roster.

Update your diagram
###################

Update the diagram you drew in the last class session to include the concepts of pulling and pushing. How do these impact your local repository? The remote one?

References
----------

`Try Git <http://try.github.io/>`_
    Interactive Git tutorial right in your browser

`Ten Git Tutorials for Beginners <http://sixrevisions.com/resources/git-tutorials-beginners/>`_
    A nice top-10 list of Git tutorials to review if you want alternatives to the prep material.

`Interactive Git Cheatsheet <http://ndpsoftware.com/git-cheatsheet.html>`_
    Visualization show what components common Git commands affect

`A Visual Git Guide <http://marklodato.github.io/visual-git-guide/index-en.html>`_
    Visual reference of how common Git commands work


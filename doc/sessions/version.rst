Distributed Version Control
===========================

.. rst-class:: hidden

.. toctree::
    :titlesonly:

    /assignments/git

.. note:: This page is a draft.

:Topics: Why everything you should version control all your things, basic workflow: cloning, staging, committing, pulling, pushing, branching, merging
:Tools: git_, Bitbucket_, GitHub_

Session #1
----------

:Prep: Read `Why Should I Use Source Control? <http://whyshouldiuse.com/source-control>`_, `Pro Git Chapter 1, Sections 1.1 through 1.3 <http://git-scm.com/book>`_, and the highly opinionated `Why Git is Better Than X <http://thkoch2001.github.io/whygitisbetter/#git-is-standard>`_ (~60 minutes). Then watch the `TotT Git Basics screencast <https://youtu.be/hYi33nTxSck>`_ (~30 minutes).
:Slides: `Git Basics <../slides/version_1.html>`_
:Assigned: :doc:`/assignments/git`

Exercises
~~~~~~~~~

SSH into *tottbox* to perform all of today's exercises. Remember to `document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later. Items you *must* complete today are marked with a |star|.

Find a partner
##############

|star| The Git assignment requires that you work with a partner. Find a partner before the end of our session today. If you can't find someone, see me before class ends.

Organize your work
##################

|star| Your shared *tottbox* directory (the one sync'ed between ``/vagrant`` and the ``tott`` folder you created in the setup assignment) is going to see more and more use from here on out. Have a plan for how you'd like to keep it organized so that you can reference your work later in the course. For example, you might consider organizing it by labs and assignments like so:

.. code-block:: console

  /vagrant/
    labs/
      cli/
        install-etherpad.sh   # 3.1.1.3. Automate with bash
        log-dupes.sh          # 3.2.1.3. Inspect logs
      version/
        git-immersion/        # 4.2.1.2. Immerse yourself
      # etc.
    assignments/
      assignment_0/
      assignment_1/

All of your assignments will live in git on BitBucket so they are backed up "for free". If you are posting your lab solutions to GitHub gists, they too are backed up. If you do other work that you do not wish to lose, you should consider putting it in Git repositories, Gists, DropBox, etc.

Immerse yourself
################

Visit the `Git Immersion <http://gitimmersion.com/>`_ web site. Starting on `lab #3 <http://gitimmersion.com/lab_03.html>`_, complete all the labs up through #28, skipping #22 and #23. The labs will take you through cloning, staging, committing, branching, and merging in a practice Ruby project. It will also teach you some handy commands supporting a typical git workflow.

You should perform all the lab exercises in a subfolder under ``/vagrant`` on *tottbox*. For instance, ``/vagrant/version/git_immersion`` or similar will work. Remember, this directory also appears on your laptop in the folder you setup for your course work in the first assignment. Feel free to use SublimeText or your preferred text editor to create and edit the files in the tutorials, but execute the git commands in a *tottbox* terminal.

.. note:: Don't worry about the Ruby code. It's there to help you practice Git, not learn Ruby. We'll cover Ruby later in the course.

Diagram git
###########

Draw a little diagram of your interactions with git in the Git Immersion tutorial so far. What effect do your commands have on your working directory, the stage, the master branch, and other branches?

Use plain text to create the diagram or an online tool like `actdiag <http://interactive.blockdiag.com/actdiag/>`_.

Session #2
----------

:Prep: Read `Pro Git Chapter 5 Section 5.1 <http://git-scm.com/book/en/Distributed-Git-Distributed-Workflows>`_ and `Section 5.2 <http://git-scm.com/book/en/Distributed-Git-Contributing-to-a-Project>`_ (~60 minutes). Then watch the `TotT Git Collaboration screencast <http://youtu.be/SWgfT8ygg8I>`_ (~28 minutes).
:Slides: `Git Collaboration <../slides/version_2.html>`_
:In Progress: :doc:`/assignments/git`

Exercises
~~~~~~~~~

SSH into *tottbox* to perform all of today's exercises. Remember to `document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Continue the Immersion
######################

Visit the `Git Immersion <http://gitimmersion.com/>`_ web site again. Start on `lab #29 <http://gitimmersion.com/lab_29.html>`_ and work through lab #49. These labs will take you through branching, merging, pulling, and pushing.

Push to BitBucket
#################

Clone the `unctott/ex_class_roster <https://bitbucket.org/unctott/ex_class_roster/>`_ repository. Add your BitBucket username to the README according to the instructions in that file. Commit and push the changes back to BitBucket. If you have a conflict, resolve it without losing any names in the roster.

Update your diagram
###################

Update the diagram you drew in the last class session to include the concepts of pulling and pushing. How do these impact your local repository? The remote one?

.. seealso::

  `Try Git <http://try.github.io/>`_
    Interactive Git tutorial right in your browser

  `Ten Git Tutorials for Beginners <http://sixrevisions.com/resources/git-tutorials-beginners/>`_
    A nice top-10 list of Git tutorials to review if you want alternatives to the prep material.

  `Interactive Git Cheatsheet <http://ndpsoftware.com/git-cheatsheet.html>`_
    Visualization show what components common Git commands affect

  `A Visual Git Guide <http://marklodato.github.io/visual-git-guide/index-en.html>`_
    Visual reference of how common Git commands work


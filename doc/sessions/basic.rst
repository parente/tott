Working at the CLI
==================

.. rst-class:: hidden

.. toctree::
    :titlesonly:

    /assignments/eval

.. note:: This page is a draft.

:Topics: Command line tools, working remotely, long-running jobs
:Tools: bash_, screen_, `ssh`_, vi_

Session #1
----------

... in which we practice working in *tottbox* at the command line and write a few simple bash scripts.

:Prep: TODO
:Slides: `CLI <../slides/basic_1.html>`_
:Due: :doc:`/assignments/setup`
:Assigned: :doc:`/assignments/eval`

Session #2
----------

... in which we test the UNIX philosophy by stringing together simple tools for grander purposes.

:Prep: TODO
:Slides: `UNIX Philosophy <../slides/basic_2.html>`_
:In Progress: :doc:`/assignments/eval`

..
   .. todo::

       Lab ideas, with lots of hints / hand holding at this stage:

       * vagrant ssh, start a screen session, clone node-redis-chat app, run redis in screen window, modify app config, run app in another screen window, disconnect ssh, confirm its still working
       * try to automate the above in a bash script
       * using online resources, figure out how to find and replace text in a set of
       * learn and report on some other interesting bash utilities
       * figure out how to pipe data from one command to another, to disk

   Strawman Outline
   ----------------

   .. todo::
       As a sample, I've outlined a pattern for how I envision the class sessions proceding using this particular topic as an example. I'm assuming here we have two, 75 minute class sessions a week.

       I hope to sanity check this approach with students ahead of the course start..

   Prep Materials
   ~~~~~~~~~~~~~~

   Out-of-class prep materials will cover definitions and example uses of bash, screen, ssh, and vi. These might take the form of a YouTube video showing slides + use, write-up on this page, or some hybrid. The syllabus states students must review these materials before class.

   * Why learn the command line?
       * Convenient or sometimes only option for remote work
       * Not everything has a fancy GUI / web interface
       * Sometimes more function available at the CLI
       * Powerful combinations of simple tools (Unix philosophy)
       * Know your discipline's history (In the Beginning, was the Command Line ...)
   * Bash CLI
       * command language interpretter (CLI)
       * commands for manipulating files and executing other programs
   * Bash language
       * scripting language to automate common CLI functions
       * has language constructs like conditionals, etc.
   * Basic bash uses
       * cd, mkdir, touch
       * cp, mv, rm
       * cat, less
   * Basic bash uses +1
       * grep
       * find
       * history
       * kill
       * $!, &
       * scp
   * ssh
       * encrypted connection for your shell (and other things)
       * defacto way to work with remote machines (dept servers)
   * Basic ssh uses
       * ssh host
       * ssh host cmd
   * Advanced ssh (no detail, just mention for students to study if they want)
       * Port forwarding
       * Proxying
       * ~/.ssh/config shortcuts
   * Editing with vi
       * screen oriented text editor (WK)
       * modal: insert or normal mode
       * good for remote editing (e.g., config files) though some people swear by it
   * Basic vi normal mode commands
       * i
       * Escape
       * :q
       * :q!
       * :wq
       * yy
       * /
       * ?
       * Many more, see cheat sheet
   * GNU screen
       * full-screen command line window manager
       * allows fast switching among shell sessions
       * "daemonized"
   * Running / resuming screen
       * screen
       * screen -S name
       * screen -rx name
       * multiple screens
   * Screen commands
       * chorded commands
       * Ctrl-a c
       * Ctrl-a k
       * Ctrl-a Space
       * Ctrl-a p
       * Ctrl-a d
       * Ctrl-a A
   * Closing remarks
       * What we covered
       * Think about how you might apply these tools
       * Do some research into more options if time permits
       * Examples to be shown and practiced in class

   In-Class
   ~~~~~~~~

   The class structure will include a brief review of the prep materials followed by in case lab exercises outlined above during the first session of the week.

   Session #1
   ##########

   * Meta
       * Announcements, assignment reminders, etc.
   * Quick review
       * Why the command line
       * What tools are we reviewing
   * See a few (show working code + walkthrough code highlights)
       * Example #1: Remote script writing
           * screen
           * vi new file
           * string a few bash commands together
           * switch to another screen
           * run and fail
           * back to first screen
       * Example #2: curl
   * Do a few
       * (This is where students would work together on the proposed lab exercises)
   * Teach a few
       * Some students report on what they learned in the last minutes of class
       * (Since we'll be using git+GitHub anyway, consider having students write up what they learn + code in GitHub Gists for later credit toward participation, extra credit, etc.)

   Session #2
   ##########

   The second session will follow practically the same format.

   * Meta
       * Announcements, assignment reminders, etc.
   * Quick review
       * We're still discussing the CLI
   * See a few more
       * Example #1: Pipes
           * find | grep > file
       * Example #2: rsync
   * Do a few more
       * (More lab exercise work. This page will have a ton of them at the ready so we can't possibly run out.)
   * Teach a few more
       * Students report on what they learned (and possibly gist documented) near the end of class
   * What's next
       * Reminder to review prep materials for next week

   .. seealso::

       `The Command Line in 2004 <http://garote.bdmonkeys.net/commandline/index.html>`_
           Garrett Birkel's response to Neal Stephenson's 1999 *In the Beginning...was the Command Line* essay, interspersed in the original text
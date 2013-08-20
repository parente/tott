Working at the CLI
==================

.. note:: This page is a draft.

:Topics: Command line tools, working remotely, long-running jobs
:Tools: bash_, screen_, `ssh`_, vi_

Session #1
----------

... in which we practice working in *tottbox* at the command line and write a few simple bash scripts.

:Prep: TODO
:Slides: `CLI <../slides/cli_1.html>`_
:Due: :doc:`/assignments/setup`

Exercises
~~~~~~~~~

|star| The setup assignment was due at the start of class. If you haven't finished it, **do so today**. Otherwise, you'll be unable to participate in-class or work on the upcoming assignment.

SSH into *tottbox* to perform all of today's exercises. Remember to `document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Count on ``man``
################

Run the following command:

.. code-block:: console

  wc /vagrant/Vagrantfile

What does the ``wc`` command do? What does the output mean? Try ``man wc`` or Googling.

Learn about background jobs
###########################

Run the following commands:

.. code-block:: console

  cd ~
  git clone https://github.com/ether/etherpad-lite.git
  cd etherpad-lite
  bin/run.sh &

Wait a bit. When the console finally states "You can access your Etherpad-Lite instance at http://0.0.0.0:9001/", visit http://192.168.33.10:9001 in your web browser. Enter a pad name. Click new pad and enter some text.

The ampersand (&) on the last command you entered tells bash to run the command in the background. Control over the terminal returns to you immediately and the command continues to run in the background. Enter ``ls`` in the console to prove it.

Now type ``exit`` in the *tottbox* terminal. What do you see in your browser? What does this tell you about background tasks?

Open a new ssh connection to *tottbox*. Run the commands:

.. code-block:: console

  cd ~/etherpad-lite
  screen -S etherpad -d -m ./bin/run.sh

Refresh your web browser. What happens? Type ``exit`` in the *tottbox* terminal. What do you see in the browser? What's different this time?

SSH back into *tottbox* and type ``screen -S etherpad -X quit``. What does this command do?

Automate with bash
##################

Start ``screen``. Create a second screen window (Ctrl-A, c). Start ``vi``. Practice flipping back and forth between the ``vi`` editor and prompt with the screen hotkey: Ctrl-A, Space.

When you're comfortable, use ``vi`` to write a script named ``etherpad.sh`` that automates the cloning and running steps your performed in the last section (the path using screen, that is). Use the terminal in the other screen window to try running your script. Flip back and forth between the two windows to debug any problems.

Include your script in your gist. When complete it should:

#. Clone etherpad-line from GitHub
#. Start a screen session
#. Run etherpad-lite in screen
#. Disconnect from the screen session immediately

Provision etherpad-lite
#######################

Check if you have etherpad running in a screen still using ``screen -ls``. If so, kill it before continuing.

Open your ``/vagrant/Vagrantfile`` in ``vi``. Modify it so that when *tottbox* starts, it executes your etherpad clone-and-run script. Test to see if it works using the ``vagrant provision`` on your laptop (**not** on *tottbox*). What does ``vagrant provision`` do again? When might provisioning be useful?

Provision from a gist
#####################

Revert your Vagrantfile back to its original state. If you destroy it, just download it again from the link in the setup assignment.

Look at the `heredoc <http://en.wikipedia.org/wiki/Here_document>`_ at the top of the Vagrantfile. What is it doing? What are some pros and cons of this approach?

Support start and stop
######################

Extend your script to support any or all of the following. Share your solutions in your gist.

1. If the etherpad-lite repository already exists, execute ``git pull`` within it instead of cloning a new copy on top of it. (Hint: Google for "bash file test operator".)
2. Accept one command line argument: a string having value "start" or "stop". Do the right thing for each value, including checking to make sure a etherpad is not already running when starting or stopped when stopping. Some hints:

  * Google for "bash command line arguments" or "bash getopts" for help parsing command line options.
  * Google for "last command exit code" for help detecting if certain commands worked or failed.

3. Print a short line about how to use your script if the user does not provide the start or stop argument::

.. code-block:: console

  usage: etherpad.sh [start|stop]

Session #2
----------

... in which we test the UNIX philosophy by stringing together simple tools for grander purposes.

:Prep: TODO
:Slides: `UNIX Philosophy <../slides/cli_2.html>`_

.. seealso::

       `The Command Line in 2004 <http://garote.bdmonkeys.net/commandline/index.html>`_
           Garrett Birkel's response to Neal Stephenson's 1999 *In the Beginning...was the Command Line* essay, interspersed in the original text
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
       * Example #2: Background processes
   * Do a few more
       * (More lab exercise work. This page will have a ton of them at the ready so we can't possibly run out.)
   * Teach a few more
       * Students report on what they learned (and possibly gist documented) near the end of class
   * What's next
       * Reminder to review prep materials for next week


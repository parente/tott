Bash, Screen, Vi, and SSH
=========================

Goals
-----

* Get comfortable working at the command line
* Gain experience with common Unix command line tools
* Understand the typical use of `ssh`_
* Practice writing simple `bash`_ scripts using `vi`_
* Practice using basic features of GNU `screen`_
* Understand pipes and redirects
* Recognize the benefits of the Unix Philosophy

Prep Materials
--------------

* Read `Learning the Shell "Why Bother?" and "What is The Shell?" sections <http://linuxcommand.org/lc3_learning_the_shell.php>`_ on linuxcommand.org
* Read the `vi intro and Interface sections on Wikipedia <http://en.wikipedia.org/wiki/Vi>`_
* Read the `GNU Screen Intro <http://aperiodic.net/screen/start>`_ and `Screen details sections on aperiodic.net <http://aperiodic.net/screen/detailed_description>`_
* Watch the TotT CLI screencast (~37 minutes)
* Read `Unix Philosophy <http://en.wikipedia.org/wiki/Unix_philosophy>`_ on Wikipedia
* Read `Unix Pipeline <http://en.wikipedia.org/wiki/Pipeline_(Unix)>`_ on Wikipedia
* Watch the TotT Unix Philosophy screencast (~27 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Count on ``man``
################

Run the following command:

.. code-block:: console

  wc /vagrant/Vagrantfile

What does the ``wc`` command do? What does the output mean? Try ``man wc`` or Googling.

Now use the ``mkdir`` command to create a directory ``fun`` in ``~/a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p``. Where should look for how to do this easily? (Hint: If you're making them one at a time, you're doing it wrong.)

Run in the background
#####################

Run the following commands:

.. code-block:: console

  cd ~
  git clone https://github.com/ether/etherpad-lite.git
  cd etherpad-lite
  bin/run.sh &

Wait a bit. When the console finally states "You can access your Etherpad-Lite instance at http://0.0.0.0:9001/", visit http://192.168.33.10:9001 in your web browser. Enter a pad name. Click new pad and enter some text. (Bonus: What happens when you try to access 0.0.0.0? What is 0.0.0.0? Why does it tell you this?)

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

When you're comfortable, use ``vi`` to write a script named ``etherpad.sh`` that automates the cloning and running steps you performed in the last section (the path using ``screen``, that is). Use the terminal in the other screen window to try running your script. Flip back and forth between the two windows to debug any problems.

Include your script in your gist. When complete, it should:

#. Clone etherpad-lite from GitHub
#. Start a ``screen`` session
#. Run etherpad-lite in ``screen``
#. Disconnect from the ``screen`` session immediately

Provision on ``vagrant up``
###########################

Check if you have etherpad running in a screen still using ``screen -ls``. If so, kill it before continuing.

Open your ``/vagrant/Vagrantfile`` in ``vi``. Modify it so that when *tottbox* starts, it executes your etherpad clone-and-run script. Test to see if it works using the ``vagrant provision`` on your laptop (**not** on *tottbox*). What does ``vagrant provision`` do again? When might provisioning be useful?

Provision from a gist
#####################

Revert your Vagrantfile back to its original state. If you destroy it, just download it again from the link in the setup assignment.

Look at the `heredoc <http://en.wikipedia.org/wiki/Here_document>`_ at the top of the Vagrantfile. What is it doing? What are some pros and cons of this approach?

Extend the script
#################

Extend your script to support any or all of the following. Share your solutions in your gist.

1. If the etherpad-lite repository already exists, execute ``git pull`` within it instead of cloning a new copy on top of it. (Hint: Google for "bash file test operator".)
2. Accept one command line argument: a string having value "start" or "stop". Do the right thing for each value, including checking to make sure a etherpad is not already running when starting or stopped when stopping. Some hints:

  * Google for "bash command line arguments" or "bash getopts" for help parsing command line options.
  * Google for "last command exit code" for help detecting if certain commands worked or failed.

3. Print a short line about how to use your script if the user does not provide the start or stop argument::

  .. code-block:: console

    usage: etherpad.sh [start|stop]

Play with pipes
###############

Install the American wordlist on your *tottbox* like I did in the prep screencast.

.. code-block:: console

  sudo apt-get install wamerican

Now run the following commands and explain what each one computes. (Hints: ``man`` is your friend. So are experimentation and Google. So is ``screen`` if you want to flip between help and a prompt.)

.. code-block:: console

  cat /usr/share/dict/words | cut -c4- | uniq | wc -l
  cat /usr/share/dict/words | cut -c2- --complement | uniq | wc -l

What other interesting analyses can you perform?

Generate passwords
##################

The ``openssl`` tool has a myriad of functions related to encryption. One of its many abilities is the generation of pseudo-random bytes. Try running:

.. code-block:: console

  openssl rand 10 -base64

One use for this ability is the generation of passwords. Say you had to generate a pseudo-random password that was 12 characters long containing only letters and numbers. How would you do it starting from the ``openssl`` command above? (Hint: Pipe the output to commands that can delete characters from strings and chop them down to the desired size.)

..
  U2FsdGVkX1/lSAC0sENauyBcm4+ZR/vS6vUT0JYVInpM4yuEyyFZNJiysVMf2Zjc
  EXJ/bXaUu1qbD7ksd6go3hrx8psfeL89HbTw7yUdCEo=

Inspect logs
############

The ``/var/log/syslog`` is the system log for *tottbox*. Have a look at its contents with ``less``. It should look something like the following::

  Aug 23 06:25:01 tottbox rsyslogd: [origin software="rsyslogd" swVersion="5.8.6" x-pid="791" x-info="http://www.rsyslog.com"] rsyslogd was HUPed
  Aug 23 07:08:45 tottbox dhclient: DHCPREQUEST of 10.0.2.15 on eth0 to 10.0.2.2 port 67
  Aug 23 07:08:45 tottbox dhclient: DHCPACK of 10.0.2.15 from 10.0.2.2
  Aug 23 07:08:45 tottbox dhclient: bound to 10.0.2.15 -- renewal in 35457 seconds.
  Aug 23 07:17:01 tottbox CRON[3771]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
  Aug 23 08:17:01 tottbox CRON[3782]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
  Aug 23 09:17:01 tottbox CRON[3785]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
  Aug 23 10:17:01 tottbox CRON[3796]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)

Each row is a log message. Each message has a fixed set of fields. In this case, the fields are date, time, host, process, message text.

Say you wanted to count the number of duplicate entries in the message text field, sort them from most dupes to least, and write the results to a file named ``analysis.txt``. What tools could you pipe together to do so? How do you write the results to a file? (Hint: I covered everything you need to cut the lines into fields and count unique values. We didn't talk about how to sort. Take a guess what that tool is called.)

..
  U2FsdGVkX1/nurf9pOebVSDAP/4Rs9Qz0YRZ742LtdrhbdGGq370s0RYEyYxUlbg
  4VbU4Re+OTIXYTxrqMQSCHvSunY86sG40XFhO7gZKk0=

View and save
#############

Change any of the commands you worked on today to pipe output both to a file and display it in the terminal. (Hint: Google.)

Be creative
###########

Construct commands or scripts to perform other interesting analyses on the word list, the log file, or some other data of your choosing. Share what you build.

References
----------

  `Learn vim Progressively <http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/>`_
    "You start by learning the minimal to survive, then you integrate all the tricks slowly."

  `The Command Line in 2004 <http://garote.bdmonkeys.net/commandline/index.html>`_
    Garrett Birkel's response to Neal Stephenson's 1999 *In the Beginning...was the Command Line* essay, interspersed in the original text
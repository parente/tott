JavaScript
==========

.. note:: This page is a draft.

:Topics: Language basics, "The Good Parts", NodeJS, standard library, virtual environments, package management
:Tools: `JavaScript <https://developer.mozilla.org/en-US/docs/Web/JavaScript>`_, NodeJS_, nvm_, npm_

Session #1
----------

... in which we learn the lingua franca of the web, JavaScript.

:Prep: Skim `A Re-Introduction to JavaScript <https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript?redirectlocale=en-US&redirectslug=JavaScript%2FA_re-introduction_to_JavaScript>`_ (~20 minutes). Enter some of the code examples from that page into `repl.it <http://repl.it/languages/JavaScript>`_ and toy with them (~15 minutes). Then watch the `TotT JavaScript screencast <>`_ (~XX minutes).
:Slides: `JavaScript <../slides/javascript_1.html>`_
:In Progress: :doc:`/assignments/git`

Exercises
~~~~~~~~~

SSH into *tottbox* to perform all of today's exercises. Remember to `document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Guess a number
##############

Write a JS guessing game that picks a random, secret number between 1 and 100, lets the user take up to 5 guesses, and states if the secret number is equal to, higher, lower than a guess. Read input from stdin and print to stdout.

Guess a word
############

Install the American English word list in *tottbox* again if you have destroyed the VM since last using it. Remember, it installs into ``/usr/share/dict/words``.

.. code-block:: console

  sudo apt-get install wamerican

Now write a JavaScript program that chooses a random word from the list, reveals it one random letter at a time to the user, and asks the user to input guesses.

Read and visualize
##################

JSON is a lightweight, text-based, human-readable, open data exchange format. It is commonly used for communication between a web server backend and application frontend. It is also a valid subset of the JavaScript language.

Download `this list of U.S. capitals <https://gist.github.com/parente/6445329/raw/458d77a784246308388d68186027f0ad35cc6fc2/us-east-west.json>`_ to *tottbox*. The list is in JSON format with the capitals sorted east to west by longitude.

Write a JS program to compute the longitude distance between each capital and the next. Output the distances to stdout along with some summary stats for the entire dataset (e.g., min distance, max, mean, median, standard deviation). Try to find a creative way to represent the relative magnitude of the distances in your output.

Fetch a quote
#############

`I Heart Quotes <http://www.iheartquotes.com/>`_ provides a web service for fetching random quotations. You can test it by visiting http://www.iheartquotes.com/api/v1/random in your browser.

Write a JS program that pulls a quote from this site and displays it on stdout in the terminal. (Hint: Look at the `http module in the NodeJS standard library, particularly the request() function <http://nodejs.org/api/http.html#http_http_request_options_callback>`_).

Serve quotes
############

Write a tiny web server using the NodeJS ``http`` module that fetches a quote from `I Heart Quotes <http://www.iheartquotes.com/>`_ and returns it to the requesting client. Run the web server in *tottbox* on port 9000 and test it by pointing Google Chrome on your laptop to http://192.168.33.10:9000. (Hint: Google for or look on the NodeJS site for the few lines of code you need to create a web server in NodeJS.)

Session #2
----------

... in which we explore the ecosystem of JavaScript tools.

:Prep: TODO
:Slides: `JS Ecosystem <../slides/javascript_2.html>`_
:In Progress: :doc:`/assignments/git`

.. todo:: Lab ideas

    * JavaScript koans
    * colors
    * moment
    * natural
    * optimist
    * underscore
    * async
    * take a seed project for a little app I started and flesh it out, add features

.. seealso::

  `Eloquent JavaScript <http://eloquentjavascript.net/>`_
    Introduction to programming in JavaScript
Python
======

Goals
-----

* Gain the ability to read and write Python code
* Recognize Python's strengths as a language
* Understand how to tap into the Python ecosystem
* Practice writing Python
* Practice using pip_ and virtualenv_

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Skim the `Python Wikipedia article <http://en.wikipedia.org/wiki/Python_(programming_language)>`_ (~10 minutes).
* Read `Python Enhacement Proposal (PEP) #20:  The Zen of Python <http://www.python.org/dev/peps/pep-0020/>`_ (5 minutes).
* Watch the `TotT Python slidecast <../_static/casts/python.html>`_ which includes live demos of:

  * `Syntax <../_static/casts/python.html#/4>`_ (~3 minutes)
  * `Rich Types <../_static/casts/python.html#/5>`_ (~2 minutes)
  * `Classical Inheritence <../_static/casts/python.html#/6>`_ (~5 minutes)
  * `Generators <../_static/casts/python.html#/7>`_ (~3 minutes)
  * `Comprehensions <../_static/casts/python.html#/8>`_ (~6 minutes)
  * `Keyword Arguments <../_static/casts/python.html#/9>`_ (~4 minutes)
  * `Variadic Functions <../_static/casts/python.html#/10>`_ (~3 minutes)
  * `Working with Python <../_static/casts/python.html#/13>`_

* Read `The Basics at learnpython.org <http://learnpython.org>`_ and try a few of the exercises (~30 minutes).
* Read the `pip package manager Wikipedia article <http://en.wikipedia.org/wiki/Pip_(package_manager)>`_ (5 minutes).
* Read the `virtualenv front page <http://docs.python-guide.org/en/latest/dev/virtualenvs/>`_ (~10 minutes).
* Watch the `TotT Python Ecosystem slidecast <../_static/casts/py_eco.html>`_ which includes live demos of:

  * `Using pip <../_static/casts/py_eco.html#/14>`_
  * `Using virtualenv <../_static/casts/py_eco.html#/21>`_

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Guess a number
##############

Write a Python guessing game that picks a random, secret number between 1 and 100, lets the user take up to 5 guesses, and states if the secret number is equal to, higher, lower than a guess. Read input from stdin and print to stdout.

Run python -m
#############

Run the following command at the prompt.

.. code-block:: console

    python -m SimpleHTTPServer

What does it output? What is SimpleHTTPServer? Where does it live? What does the ``-m`` command line flag do? Document what you discover.

Compare pip and npm
###################

How are ``pip`` and ``npm`` similar? Different? What about ``pip`` plus ``virtualenv``? Write down your observations.

Resize images
#############

`Pillow <http://pillow.readthedocs.org/en/latest/>`_ is an image manipulation library for Python.

Create a virtualenv and use ``pip`` to install Pillow. Write a Python script that uses Pillow to resize all of the images in a directory. Let the user specify the name of the input directory, name of the output directory, and desired width or height of the resulting images on the command line. Maintain the aspect ratio of each image processed. (Hint: Look into the ``optparse`` or ``argparse`` packages for Python to help with command line parsing.)

Bottle it up
############

Bottle_ is a web microframework for Python. (It's a single .py file!)

Use ``pip`` to install Bottle into the same virtualenv you created for the image resize utility. Then define a web service API for your image resize utility. Support upload of images in common formats and specification of the desired width or height while maintaining aspect. For example, I might access your completed service using ``curl`` like so:

.. code-block:: python

    curl -X POST -d @myimage.png http://example.com/resize?width=250 --header "Content-Type:image/png"

Show HackerNews
###############

HackerNews is a social new web site for geeks. The site has a `web API <http://api.ihackernews.com/>`_ for hackers to, well, hack.

Use ``pip`` to install the `thekarangoel/HackerNewsAPI <https://github.com/thekarangoel/HackerNewsAPI>`_, a Python library simplifying access to the HN API. Use it to write a command line tool that can print the top N front page items or newly posted items where the user can specify N.

Add more options to your command line tool as it suits your fancy (e.g., show comments for a given news story and pipe to less for navigation.)

Spoon the Web soup
##################

`BeautifulSoup <http://www.crummy.com/software/BeautifulSoup/>`_ makes it easy to parse messy HTML markup. It's very useful in screen scraping applications.

Find a public web page of interest to you that provides no clean web API (e.g., http://durhamnc.gov/Pages/NNList.aspx). Using BeautifulSoup, scrape the page for notices. Compare what you extract on the current run to the last run, and notify the user of any differences.

Think about how you might make your site checker run on an interval and notify the user of changes unobstrusively.

Mechanize the web
#################

Install the ``Mechanize`` library using ``pip``. What does it do? How might it be useful? Build something using it. (Hint: A CLI for your favorite search engine?)

Explore PyPI
############

The Python Package Index (PyPI) is host to `quite a few libraries <http://ssaboum.github.io/meta-deps/>`_. Browse through it. Get a feel for what exists. Pick one or more libraries that interests. Write an example application demonstrating what they do. Write up a little blog post explaining how to use it. Share it with the world.

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

Create *The Daily Dose*
#######################

Create a web application that generates spoken summaries of select web sites for users to download for offline listening, say during a commute, while working out, on a bike ride, etc. Allow users to pick what sites they would like included in their summary and in what order.

Don't worry about user customization initially. Offer each visiting user the list of sources, allow him or her to pick and order, generate the summary (perhaps cached on an interval), and offer a link to download it.

Choose a web framework, text-to-speech library, and new sources to support. (Hint: HackerNews please.) Also consider if a text summarizer like `sumy <https://github.com/miso-belica/sumy>`_ would help, depending on the types of sites and pages you choose to summarize.


References
----------

`PyPI`_
    Official Python package index

`Hitchiker's Guide to Python <http://docs.python-guide.org/en/latest/>`_
    Opinionated best-practice guide for Python developers

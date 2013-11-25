Data Science and IPython
========================

Goals
------

* Stick a definition on "data science"
* Learn about Python libraries for data science
* Understand the usefulness of `IPython Notebook`_
* Practice manipulating data using Pandas_
* Practice plotting using matplotlib_
* Practice machine learning with scikit-learn_

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Read `What is Data Science? <http://www.kaggle.com/wiki/WhatIsDataScience>`_ at Kaggle. (~1 minute)
* Read the `Data Science article <http://en.wikipedia.org/wiki/Data_science>`_ on Wikipedia. (~10 minutes)
* Watch the `10-minute whirlwind tour of pandas <http://vimeo.com/59324550>`_ by Wes McKinney. (~10 minutes)
* Watch the `IPython Notebook intro screencast <https://www.youtube.com/watch?v=HaS4NXxL5Qc#t=139>`_ by Titus Brown starting at 2:17. (~6 minutes)
* Skim the introductory IPython Notebooks.

  * `Part 1 - Running Code in the IPython Notebook <http://nbviewer.ipython.org/url/github.com/ipython/ipython/raw/master/examples/notebooks/Part%201%20-%20Running%20Code.ipynb>`_
  * `Part 2 - Basic Output <http://nbviewer.ipython.org/url/github.com/ipython/ipython/raw/master/examples/notebooks/Part%202%20-%20Basic%20Output.ipynb>`_
  * `Part 3 - Plotting with Matplotlib <http://nbviewer.ipython.org/url/github.com/ipython/ipython/raw/master/examples/notebooks/Part%203%20-%20Plotting%20with%20Matplotlib.ipynb>`_
  * `Part 4 - Markdown Cells <http://nbviewer.ipython.org/url/github.com/ipython/ipython/raw/master/examples/notebooks/Part%204%20-%20Markdown%20Cells.ipynb>`_
  * `Part 5 - IPython's Rich Display System <http://nbviewer.ipython.org/url/github.com/ipython/ipython/raw/master/examples/notebooks/Part%205%20-%20Rich%20Display%20System.ipynb>`_

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. In this particular session, you can `post your IPython Notebooks as gists <https://gist.github.com/>`_, view them in `NBViewer <http://nbviewer.ipython.org/>`_, and share their NBViewer URLs in the `TotT community`_ later.

Start a notebook
################

Create a shared *tottbox* folder to store your notebooks and start the IPython Notebook server running like so:

.. code-block:: console

    mkdir -p /vagrant/notebooks
    cd !$
    ipython notebook --ip=0.0.0.0

Open your web browser and visit it on the *tottbox* IP and port printed. Create a new notebook in the web UI.

Load the Tar Heel Reader book data
##################################

Gary runs a web site called `Tar Heel Reader (THR) <http://tarheelreader.org/>`_. It hosts a collection of community-contributed, easy-to-read, accessible books. If you haven't seen it, visit the site now and read a book. In the following exercises, we will analyze a November, 2013 snapshot of the books hosted on the site (approximately 30,000).

THR books reside in a SQL database. To ease our exploration, I've converted the ``books`` SQL database table into a `Pandas DataFrame <http://pandas.pydata.org/pandas-docs/stable/dsintro.html#dataframe>`_ and serialized it to disk. `Download a zipped copy of the DataFrame <https://dl.dropboxusercontent.com/u/264241/tott/thr.dataframe.zip>`_ to your laptop. Unzip it and move the ``*.dataframe`` object into a shared *tottbox* folder (e.g., putting it in the ``notebooks`` folder you created is fine for now).

In the notebook you created, import the ``pandas`` package and load the DataFrame with the code below.

.. code-block:: python

    import pandas
    pandas.read_pickle('thr.dataframe')

Take some basic measurements
############################

With the DataFrame loaded, use the many methods and properties of the DataFrame to explore the data. Try to answer the following questions. (Hint: Use the Pandas documentation. Hit the Tab key repeatedly after ``.`` or ``(`` in the notebook for autocompletion and function help.)

* What are the columns in the DataFrame?
* What does each row represent?
* How many total rows are there?
* How many total books are there?
* How many books have been reviewed? Haven't?
* Books are written in how many different languages?
* What is the mean number of pages per book? Median? Minimum? Max? Variance?
* How many different authors have written books?

Prep words per page (wpp) data
##############################

Say we want to understand how the length of the pages in the Tar Heel Reader books have changed or not changed over time. To do so, we first have to chunk the page text into words based on some definition. Choose a definition and write it down in your notebook in a Markdown cell. Then use the ``apply`` method on the ``text`` column (a Series) of the DataFrame to do so. Pass it a function that splits each page of text into a list of words according to your definition. Save the return value in a variable called ``words``.

After producing the ``words`` Series, create another series called ``wpp``. Use the ``apply`` method again, but this time compute the number of words per page instead of the words themselves.

Plot wpp over time
##################

Return to the original DataFrame. Inspect some of its rows using the ``head`` and ``tail`` methods. Is it ordered in some way? Write your assumptions in a Markdown cell in your notebook.

Now plot the ``wpp`` Series you created in the prior step using the ``Series.plot`` method. The y-axis should represent the number words on a page and the x-axis should represent a page in a book. The pages should be sorted in ascending chronological order as x increases.

Can you spot a trend in the plot? What if you play with the plotting parameters? Try a scatter plot instead? Takes Markdown notes in your notebook.

Plot the rolling, expand wpp mean
#################################

Pandas has quite a few functions for computing *moving statistics*, stats computed over an ordered sample of data. Try using the moving mean function on the ``wpp`` Series and plot the results. Try a few more times with different parameter values. What does it do? What do you see? Write it in the notebook. (Hint: http://en.wikipedia.org/wiki/Moving_average)

Pandas also has support for *expanding windows*, stats computed over an ordered sample of data up to and including each datum in the order. Try using the expanding mean on the ``wpp`` Series. Try a few more times with different parameter values. What do you see? Write it in the notebook?

Is there anything interesting to report from these plots?

Consider pages per book (ppb) over time
#######################################

Say we now want to understand how the pages per book (ppb) metric varies over time. Prepare a ``ppb`` Series and study it. Note any interesting findings in your notebook. (Hint: The ``DataFrame.groupby`` method will get you started with preparing the data.)

Learn about clustering
######################

THR authors can assign one or more fixed categories to their books. Nothing dictates that books must fit the available categories, and so it's quite possible that additional categories or alternative organization schemes exist. One way to discover such patterns is to cluster books according to some measure of similarity and then simply study the books in a cluster.

The scikit-learn package has many `clustering algorithms <http://scikit-learn.org/stable/modules/clustering.html>`_ available. The basic one that we'll use is called `k-means clustering <http://en.wikipedia.org/wiki/K-means_clustering>`_. Given an integer ``k`` number of clusters, k-means will attempt to partition our ``n`` books so that each book belongs to the cluster with the nearest mean-value for some property of our books. We need to choose a value for ``k`` and decide what property we'll use to cluster them.

Picking ``k`` is empirical. We'll try a few values and see what results we get. Deciding what property we'll use to cluster requires more thinking. If we want to discover common themes or topics across books, we might try clustering our books based on their titles. However, we have to remember that THR has books written in many languages. If we try running the clustering algorithm across all books at once, it's not clear how books written in different languages will or will not relate. To simplify our task, we'll focus on books written in English alone for the time being. (We can always try clustering on other languages independently or across languages later.)

Prep English titles
###################

Cluster English titles
######################

Plot English title cluster terms
################################

Prep language classifier data
#############################

Train a language classifier
###########################

Evaluate a language classifier
##############################

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

Build a recommendation engine
#############################

Gary has a second dataset derived from the Tar Heel Reader site that captures what books were read by what visitors to the site over time.


References
----------

`Choosing the right estimator <http://scikit-learn.org/stable/tutorial/machine_learning_map/index.html>`_
    A rough guide for choosing the right scikit-learn algorithm for your machine learning task

`A gallery of interesting IPython Notebooks <https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks>`_
    Gallery of IPython Notebooks

`Matplotlib gallery <http://matplotlib.org/gallery.html>`_
    Gallery of matplotlib examples

`Scikit-learn examples <http://scikit-learn.org/stable/auto_examples/>`_
    Gallery of scikit-learn examples

`Python Scientific Lecture Notes <http://scipy-lectures.github.io/>`_
    Tutorial material on the scientific Python ecosystem

`Parallel Machine Learning with scikit-learn and IPython <https://github.com/ogrisel/parallel_ml_tutorial>`_
    Tutorial on machine learning over "big data"
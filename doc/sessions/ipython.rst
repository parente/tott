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

Open your web browser and visit it on the *tottbox* IP and port printed, http://192.168.33.10:8888. Create a new notebook in the web UI.

Load the Tar Heel Reader book data
##################################

Gary runs a web site called `Tar Heel Reader (THR) <http://tarheelreader.org/>`_. It hosts a collection of community-contributed, easy-to-read, accessible books. If you haven't seen it, visit the site now and read a book. In the following exercises, we will analyze a November, 2013 snapshot of the books hosted on the site (approximately 30,000).

THR books reside in a SQL database. To ease our exploration, I've converted the ``books`` SQL database table into a `Pandas DataFrame <http://pandas.pydata.org/pandas-docs/stable/dsintro.html#dataframe>`_ and serialized it to disk. `Download a zipped copy of the DataFrame <http://static.mindtrove.info/tott/tott/thr.dataframe.zip>`_ to your laptop. Unzip it and move the ``*.dataframe`` object into a shared *tottbox* folder (e.g., putting it in the ``notebooks`` folder you created is fine for now).

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

Plot the rolling, expanding wpp mean
####################################

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

Use Pandas to get a Series of unique English book titles from the books DataFrame you loaded. This step amounts to a one-liner in which you:

#. Select rows in the DataFrame that have language equal to "en"
#. Select the title column from the remaining rows
#. Drop duplicate titles

Once you have the title Series, you need to transform the titles into `feature vectors <http://en.wikipedia.org/wiki/Feature_vector>`_ on which the k-means algorithm can operate. The ``sklearn.feature_extraction.text`` package has a number of classes that can do this with minimal effort. Add the following imports to your notebook:

.. code-block:: python

   from sklearn.feature_extraction.text import CountVectorizer, HashingVectorizer, TfidfVectorizer

Now read the scikit-learn doc about these three classes and use each of them to transform your title Series into a new, independent series: ``count``, ``hash``, ``tfidf``.

Start simply and use defaults where possible. Until you can visualize how the clustering is working, it makes little sense to start turning random knobs.

Cluster English titles
######################

We'll now run the k-means clustering algorithm over each one of your transformed title Series. The immediate goal is to get a sense of how our choice of parameters affects the ability of k-means to decompose the entire set of books into clusters of books related by title.

Add the following import to your notebook:

.. code-block:: python

   from sklearn.cluster import KMeans

Construct an instance of the class called ``km``. Configure it to create 20 clusters. Then ``fit`` the class to the first of your three title transformation Series, ``count``. Once you've fit the model, create a new DataFrame that pairs the human-readable book titles with the assigned cluster IDs like so:

.. code-block:: python

   # where titles is your untransformed title Series
   en_titles = pandas.DataFrame(titles)
   en_titles['count_cluster'] = km.labels_

Re-fit the ``km`` algorithm to your ``hash`` and ``tfidf`` Series. Add each one to ``en_titles`` as a new column.

Now, for each of the three ``*_cluster`` columns you created, determine how many books fall into each of the 20 clusters. (Hint: ``groupby`` should help you here.)

Does the clustering algorithm appear to work better or worse for any of the transformations? What if you choose to create fewer or more clusters? What if you play with other options to the Vectorizer constructors or the KMeans constructor? Try turning some knobs and document what you discover in your notebook.

Visualize your clusters
#######################

The k-means algorithm assigns each book title to a cluster identified by an integer. That is all. Interpreting the cluster assignments in light of the book titles is the responsibility of the analyst (i.e., you).

Start this task by printing some of the tiles in a cluster with the following code:

.. code-block:: python

   en_titles[en_titles.count_cluster == 0].head(25)

Vary the column name, cluster integer, method of sampling, and sample size. Do you see any patterns within your clusters? Can you assign a category name to any cluster (e.g., books about X).

Studying clusters in this manner is inefficient at best and biased at worst. For instance, just because you look at the first 25 titles in a set of 900 books doesn't mean those 25 are representative of the full set.

Find a way to better visualize and interpret your clusters. Consider manipulations of the titles and clusters using Pandas to show cluster contents compactly and without bias. Consider using matplotlib to display the information graphically in some way. Demonstrate your technique and document its pros and cons.

Interpret your results
######################

Do your clusters experiments reveal any patterns in book titles? Do they suggest any complementary categorizations or tags for books on the THR site? Do they suggest common topics addressed by THR authors?

Are there clusters that are not easy to explain? Are there books that seem to befuddle clustering? Do you have any ideas about how to study and understand these books better?

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

Find books misclassified by language
####################################

Gary says that some number of books on the Tar Heel Reader site are marked as having the wrong language. Manually finding these misclassifications is a pain. A language classifier could help alleviate these problems. Using the data provided, we could:

#. train the classifier on a set of books with known-to-be-correct language assignments (the *ground truth*),
#. evaluate the accuracy of the classifier on a hold-out test set of books by comparing its language predictions with the ground-truth,
#. apply a well-performing classifier to the entire set of books, and
#. review those books where the classifier predicts a language that mismatches the language assigned by the human author.

The `text document classification example in the scikit-learn documentation <http://scikit-learn.org/stable/auto_examples/mlcomp_sparse_document_classification.html>`_ might help get you started. So might the `sample pipeline for text feature extraction and evaluation <http://scikit-learn.org/stable/auto_examples/grid_search_text_feature_extraction.html>`_ in the scikit-learn doc. In fact, there are many ways to skin this cat using scikit-learn. The key is setting up your notebook to quickly try new experiments in defining features, in picking a classifier algorithm, in choosing classifier parameters, and in evaluating performance.

If you want to tackle this project in earnest, talk with Pete. He has some feature selection code that might help.

Build a recommendation engine
#############################

Gary has a second dataset derived from the Tar Heel Reader site that captures what books were read by what visitors to the site over time. This data can be used to train a `recommendation engine <http://en.wikipedia.org/wiki/Recommender_system>`_ based on `collaborative filtering <http://en.wikipedia.org/wiki/Collaborative_filtering>`_. Talk with Gary if you are interested in playing with this dataset and building a recommendation engine for the THR site.

Improve the IPython Notebook UI
###############################

`jtyberg <https://github.com/jtyberg>`_ writes:
  
  I love IPython notebook for ad-hoc analysis. However, there are a few shortcomings of the web UI that lessen my user experience. Among them is the tedious nature of reordering cells (moving them up or down) within a notebook. I would like to be able to select multiple cells and move them up/down the page all at once.

  A possible solution would be to enable grouping of cells. Can we modify the underlying DOM structure by adding cell elements into the same parent? Then we can manipulate the parent element.

  Another idea would be a gutter view within the notebook that shows a condensed view of the notebook content (think Sublime text editor). What if we could select individual cells or cell groups and move them up/down the page by dragging and dropping from within the gutter? That would be sweet.

This is more of a JavaScript project and is posted again in the :doc:`jQuery session project list <jquery>`. The IPython Notebook has an `unstable but working JavaScript API <https://github.com/ipython/ipython/tree/master/IPython/html/static/notebook/js>`_ that might be useful in accomplishing either or both of these.

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
Server-Side Web
===============

.. rst-class:: hidden

.. toctree::
    :titlesonly:

    /assignments/hof

.. note:: This page is a draft.

:Topics: Web servers, REST, non-relational data stores (aka NoSQL)
:Tools: Bottle_, ExpressJS_, MongoDB_

Session #1
----------

:Prep: TODO
:Slides: `The Web We Don't (See) <../slides/server_1.html>`_
:Due: :doc:`/assignments/uttt`
:Assigned: :doc:`/assignments/hof`

Session #2
----------

:Prep: TODO
:Slides: `NoSQL <../slides/server_2.html>`_
:In Progress: :doc:`/assignments/hof`

.. todo:: Lab ideas

    * build a REST API that models friend-friend-loaned item graphs; use a d3 visualization frontend I give them as a test case for it (they get the eye candy if they succeed)
    * read doc about serving static files, and get either bottle or express to serve up a prior client side example
    * start with a mongodb persist file, run the server using, use the cli to query and modify
    * use a python or javascript client for mongodb to query the same file

.. seealso::

    `Django`_
        Batteries-included server-side web framework for Python

    `Ruby on Rails`_
        Batteries-included server-side web framework for Ruby

    Redis_
        Lightning fast, in-memory data structure server

    CouchDB_
        Database that uses JSON for documents, JavaScript for MapReduce queries, and HTTP for an API

    Lucene_
        High-performance, full-text search engine library

    Solr_
        Search platform using Lucene that supports faceted search, rich documents, scalability, and more

    `A comparison of data stores <http://kkovacs.eu/cassandra-vs-mongodb-vs-couchdb-vs-redis>`_
        Nice reference that highlights the main differences among many non-relational databases
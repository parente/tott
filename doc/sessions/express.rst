Express and Jade
================

Goals
-----

* Know what the Express_ framework is
* Know what the Jade_ template language is
* Learn how to bootstrap a basic web application
* Understand Express routes, views, and middleware
* Practice implementing web APIs using Express
* Practice implementing static web UIs using Jade

Introduction
------------

Express is a JavaScript framework that aids the development of web servers and web APIs. Jade is a templating language for web pages with dynamic values. Together, they enable NodeJS developers to create dynamic web sites.

To get started, watch the `Express slidecast <../_static/casts/express.html>`_ (~35 minutes) demonstrating the use of Express to build a simple web application. The slide cast includes live demos of the following:

  * `Starting an Express Application and Server on slide 5 <../_static/casts/express.html#/5>`_ (~9 minutes)
  * `Handling Requests and Responding in Express Routes on slide 7 <../_static/casts/express.html#/7>`_ (~9 minutes)
  * `Using Express Middleware on slide 9 <../_static/casts/express.html#/9>`_ (~10 minutes)

Now watch the `Jade slidecast <../_static/casts/jade.html>`_ showing the use of Jade to generate web pages with little markup and variable fields. The slidecast includes live examples of all of the following:

  * `Rendering Static HTML on slide 3 <../_static/casts/jade.html#/3>`_ (~3 minutes)
  * `Embedding JS in Templates on slide 4 <../_static/casts/jade.html#/4>`_ (~2 minutes)
  * `Jade Mixins on slide 5 <../_static/casts/jade.html#/5>`_ (~3 minutes)
  * `Rendering Jade Views in Express on slide 10 <../_static/casts/jade.html#/10>`_

If time permits, review these additional pages:

* Read the `RESTful Web APIs <http://en.wikipedia.org/wiki/Representational_state_transfer#RESTful_web_APIs>`_ section of the Representational state transfer (REST) page on Wikipedia. Then skim the rest of the page. (~10 minutes).
* Read `Understanding Express.js <http://evanhahn.com/understanding-express-js/>`_ (~20 minutes).
* Watch `Learning the Jade Templating Engine Syntax <http://cssdeck.com/labs/learning-the-jade-templating-engine-syntax>`_ (~15 minutes). Note the play button and speed controls are in the bottom right of the CSSDeck web app.

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Design a dead-drop
##################

Imagine you want to build a semi-secure dead-drop web site. Two parties can use your site to exchange private messages without authenticating as long as they both agree upon a secret key ahead of time. For example, Alice and Bob might decide, face-to-face, that Alice will post the first message to Bob under the alias ``qwerasidfj98324wer`` on the site starting tomorrow at 11 PM. Alice posts her message to Bob at ``http://thesite.com/messages/qwerasidfj98324wer``, includes another secret alias for Bob to use when responding, and a time at which Alias will check for Bob's reply. Bob visits the URL including the agreed upon alias and retrieves Alices message, at which point it is promptly deleted from the site. Bob posts a message back to Alice at a new alias, including yet another new alias and retrieval time in his message. Message drops continue in the same manner indefinitely. Of course, all traffic to and from the site is encrypted.

Here's a start of a web API for the site supporting the creation of a new message and the retrieval of it:

    POST /messages
    GET /messages/[messageid]

Write down two additional routes supporting supporting the cases where Alice needs to update or delete her message after posting it, before Bob can retrieve it (or vice versa).

Bootstrap the code
##################

Express has a command line utility that will lay out a suggested skeleton for an Express-based web application. I used it in the Jade screencast. Use ``npm`` to install the Express module now (globally or locally, your choice) and then use the ``express`` command line to generate a new skeleton for your dead-drop. (Hint: Don't forget to run ``npm install`` in the project skeleton too.)

Secure the site
###############

The Express skeleton supports HTTP connections out of the box. This setup sends all traffic to and from the web server across the Internet in clear-text. For a dead-drop, this is a big no-no because it allows anyone to sniff the message text on the wire when it is posted or retrieved.

Modify the generated boilerplate to use HTTPS instead of HTTP. Google for an example of how to do it or refer to the NodeJS documentation. (Hint: You'll need to generate a self-signed SSL certificate for the site. Again, Google.)

Add message routes
##################

Implement Express routes for creating, retrieving, updating, and deleting messages on the dead-drop site. Keep all messages in memory. Remember to delete a message once it is successfully retrieved.

Manually test your routes using ``curl`` and some sample data at the command line. (Hint: Read the ``curl`` man page or scour the web for examples of how to GET, POST, etc.) Or, if you want to leapfrog ahead, look at a test framework like Mocha_.

Add message UI
##############

Use Jade to build a view for adding a message under a user-provided alias, mapped to a URL path. Show the UI when the user GETs the messages collection URL. For example, if you designed your REST API around ``/messages/*``, you should render the view for adding a message when the user's browser visits ``/messages``. Use Jade to build a template to render the message in a structured manner.

Add stats middleware
####################

Implement an Express middleware function that tracks basic site stats in memory. Count the number of messages posted, messages retrieved, attempts to retrieve messages more than once, and any other statistic you find interesting. Make sure none of your statistic reveal unique identifying information about the users of the site, however.

Add stats UI
############

Show the stats the dead-drop site has collected when a user visits `/stats` or an equivalent resource. Do some basic formatting of the information, say in justified tables, to make it somewhat simple for users to consume. Use Jade to template the page.

Add expiration
##############

Add an automatic 1 hour expiration to all messages posted to the site. That is, if Alice posts a message and Bob fails to retrieve it within 1 hour, the site should delete the message automatically.

You could implement this feature yourself, or you could scour NPM or Google for existing solutions for storing key-value data in memory with an optional expiration. (Hint hint).

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

Improve security
################

Think about the security flaws of the dead-drop site. What attack vectors exist? Think about how you might improve the security of the dead-drop site without forcing users to authenticate to post or retrieve messages. Document improvements and try to implement them.

For instance, in our running example, Alice and Bob must agree upon an alias to use for the first drop. If this alias is weak and compromised, an impostor might pose as Bob without Alice's knowledge thereafter. Is there a way around this problem?

Improve UI
##########

Make the dead-drop site easier on the eyes for would-be users. Consider simple styling fixes to start or maybe go as far as using `Bootstrap`_. If you're collecting many stats, improve the way they are rendered as well, perhaps using d3.js_ or another visualization library.

Add Features
############

There are many possibilities for making the dead-drop site more useful. Be creative. Show off.

References
----------

`Express API <http://expressjs.com/api.html>`_
    Express API documentation
`Jade Reference <http://jade-lang.com/reference/>`_
    Jade language reference

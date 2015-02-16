Express and Jade
================

:Author: `Peter Parente <https://github.com/parente>`_
:Builds-on: :doc:`nodejs`

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

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it with the `TotT community`_ later.

Understand a dead-drop
######################

Imagine you want to build a semi-secure dead-drop web site. Two parties can use your site to exchange private messages without authenticating as long as they both agree upon a secret key ahead of time. For example, Alice and Bob might decide, face-to-face, that Alice will post the first message to Bob under the alias ``qwerasidfj98324wer`` on the site tomorrow at 11 PM. Alice posts her message to Bob at ``http://thesite.com/messages/qwerasidfj98324wer``, includes another secret alias for Bob to use when responding, and a time at which Alias will check for Bob's reply. Bob visits the URL including the agreed upon alias and retrieves Alice's message, at which point it is promptly deleted from the site. Bob posts a message back to Alice at a new alias, including yet another new alias and retrieval time in his message. Message drops continue in the same manner indefinitely. Of course, all traffic to and from the site is encrypted.

In the following exercises, you'll build such a site.

Bootstrap the code
##################

Express has a command line utility that will lay out a suggested skeleton for an Express-based web application. I used it in the Jade screencast. Use ``npm`` to install the Express module now (globally or locally, your choice) and then use the ``express`` command line to generate a new skeleton for your dead-drop. (Hint: Don't forget to run ``npm install`` in the project skeleton too. See the first demo of the Express slidecast if you don't know what I'm talking about.)

Test that the skeleton works by running ``node app.js`` in the project directory and visiting http://192.168.33.10:3000 in your web browser.

Secure the site
###############

The Express skeleton supports HTTP connections out of the box. This setup sends all traffic to and from the web server across the Internet in clear-text. For a dead-drop, this is a big no-no because it allows anyone to sniff the message text on the wire when it is posted or retrieved. (Read about `man-in-the-middle-attacks <http://en.wikipedia.org/wiki/Man-in-the-middle_attack>`_ if you are interested.)

Modify the generated boilerplate to use HTTPS instead of HTTP. Google for an example of how to do it or refer to the NodeJS documentation. (Hint: You'll need to generate a self-signed SSL certificate for the site. Again, Google.)

Add message routes
##################

Look at the application skeleton Express generated for you. Open the ``routes/index.js`` file. Remove any boilerplate functions from the file. Then define the following functions for creating and retrieving messages.

.. code-block:: javascript

   exports.get_message = function(req, res) {
      // TODO: get the message ID from the request, check if we have that message
      // in memory, return it if so or respond with a 404 error if not, delete the message
   };

   exports.post_message = function(req, res) {
      // TODO: get the message ID and text from the request, store the message in memory
      // keyed by the ID
   };

Now open ``app.js`` in the root of the project. Look for the calls to register the boilerplate routes. Remove them and register your new functions like so.

.. code-block:: javascript

   app.get('/messages/:id', routes.get_message);
   app.post('/messages/:id', routes.post_message);

Now implement the ``get_message`` and ``post_message`` functions as described in the comments. Manually test your POST route using ``curl`` and some sample data at the command line. For example, to test posting a new message:

.. code-block:: bash

   curl -k -X POST --data-urlencode "message=the cheese flies at midnight; next @12 pm tmw under code 123dfjer3" https://192.168.33.10:3000/messages/qwerasidfj98324wer

Manually test your GET route by visiting https://192.168.33.10:3000/messages/qwerasidfj98324wer in your browser, replacing the last part of the URL with the message ID to retrieve.

Remember to restart your Express application when you make changes to it. (Hint: Google for ways to automate the restart if it gets tedious.)

Add message UI
##############

Posting messages using ``curl`` works, but we can do better. Use Jade to build a view for adding a message under a user-provided ID, mapped to a URL path. Show the UI when the user GETs the home page of the site. In other words, modify the `views/index.jade` to show a form the user can complete to submit a message.

If you plan to use a plain old HTML form, you'll probably want to add a request handler that gets the message ID out of the form data. If you want to keep the web API as it is, you'll need to use some Javascript to either modify the form action or submit the request using AJAX.

Add linking
###########

Now users can submit messages easily. Retrieving them is a bit clunky. The user has to visit `/messages/:id`, read the message, edit the URL in the address bar, and fill out the form.

Instead of simply returning the message text, render a Jade template that shows the message and includes a link back to the home page. Similarly, render a Jade template that reports success after posting a message and includes a link back to the home page.

Add stats middleware
####################

Implement an Express middleware function that tracks basic site stats in memory. Count the number of messages posted, messages retrieved, attempts to retrieve messages more than once, and any other statistic you find interesting. Make sure none of your statistic reveal unique identifying information about the users of the site, however.

Add stats UI
############

Show the stats the dead-drop site has collected when a user visits `/stats` or an equivalent resource. Do some basic formatting of the information, say in justified tables, to make it somewhat simple for users to consume. Use Jade to template the page.

Add expiration
##############

Add an automatic expiration to all messages posted to the site. That is, if Alice posts a message and Bob fails to retrieve it within one hour after a time mentioned in the message, the site should delete the message automatically. If no time is mentioned, the post should self-destruct within one hour of its posting.

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

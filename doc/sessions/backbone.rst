MV* and Backbone
================

:Author: `Peter Parente <https://github.com/parente>`_
:Builds-on: :doc:`jquery`, :doc:`bootstrap`

Goals
-----

* Learn a bit about MVC, MVP, MVVM, etc. design patterns
* Learn the basic concepts of the Backbone _ framework
* Recognize the MV* pattern in Backbone
* Understand how Backbone can help structure client-side code
* Practice writing web applications using Backbone

Introduction
------------

TODO: intro and slidecasts

If time permits, review these additional pages:

* Read the `Wikipedia Model-view-controller article <http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller>`_ (~10 minutes)
* Read `the Introduction section of the Backbone doc <http://backbonejs.org/#introduction>`_ (~5 minutes)
* Read `Why you should use MV* frontend frameworks like Backbone, Ember, and Angular <http://maximilianschmitt.me/blog/web-development/why-you-should-use-mv-front-end-frameworks-like-backbone-ember-and-angular/>`_ (~10 minutes)
* Read `the annotated Todos.js Backbone example code <http://backbonejs.org/docs/todos.html>`_ (~15 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Clone the Kvetch project
########################

I've seeded a project called Kvetch on GitHub at https://github.com/parente/tott-kvetch. It is a starting point for building a place for people to post anonymous gripes, just like in the Daily Tar Heel. We will build out this application throughout the following exercises.

To get started, clone the project to your *tottbox* shared folder. Start a bash session on *tottbox*, change to the project directory, and run ``make build``. The build will download dependencies of the project, namely Bottle_, jQuery, Bootstrap, and Backbone, and Underscore. When the build completes, run ``make server`` in the same directory. Then visit ``http://192.168.33.10:8080``` in your browser.

Spend a few minutes looking at the application UI and its structure on disk. Note the following:

* The ``Makefile`` installed the project prerequisites. What libraries did it install when you ran ``make build``? What did it run when you typed ``make server``?
* ``server.py`` contains a complete implementation of the REST API. What routes does it support? What data does it take as input and respond with as output?
* ``views/index.tpl`` defines the one HTML document used by the app. What JavaScript files does it load? What JS code executes when the page finishes loading?
* The project contains placeholders for Backbone components. Where are they? What placeholders are defined?

Document what you find.

Understand the requirements
###########################

When complete, I would like Kvetch to behave as follows:

* The newest 25 posts appear when the page loads in the *Latest* column
* The the top 25 posts with the most upvotes appear in the *Favorites* column when the page loads, sorted from most votes to least.
* Any user my enter a post on the site up to 140 characters in length.
* The user's post should appear at the top of the *Latest* column when entered.
* Each post should show the post body text, the date the post was posted, and the number of upvotes the post has received.
* Each post should also show a ``+1`` button to allow a visiting user to vote for the post *once per page load*.
* If a user upvotes a post, the *Favorites* column should re-sort appropriately.
* A page refresh should result in the latest information from the server being shown.
* Posts and upvotes should persist across server restarts.

The HTML, CSS, REST API, and database persistence are already implemented. You need to add the JavaScript code necessary to support the above.

Before proceeding, think about how you might implement the necessary application logic without a MV* framework, say using vanilla JS or jQuery alone. Jot down your initial thoughts.

Understand the components
#########################

Think about how you might structure the frontend code for Kvetch in terms of Backbone models, views, and collections. What data and logic might go together in models? Are there natural collections of models? What must be shown to the user in a application view? Does it help to decompose the app into multiple views?

Write down your thoughts. Draw a diagram. Depict how the frontend components would interact in your design. Then, compare your design with the one represented by the files and folders in ``public/js``. (Hint: There is no one right answer to designing this application. But this rest of this tutorial leads you down the path I chose.)

Define a post model
###################

Open the ``public/js/models/post.js`` file. In it you'll see a call to the function ``Backbone.Model.extend`` with an empty object as its parameter. You need to populate this object with the following to define a simple model for a post on the kvetching board:

* The default value of the ``body`` model property, an empty string
* The default value of the ``vote`` model property, zero
* The attribute attribute name that will serve as the unique ID of the post, ``rowid``

(Hint: Look in the Backbone documentation in the Models section for what properties you need to set. Or refer to the TodoMVC Backbone example.)

Define a posts collection
#########################

Open the ``public/js/collections/post.js`` file. In here, you'll see a call to the function ``Backbone.Collection.extend``. You need to populate its argument with the following to define a collection of posts on the kvetching board:

* The model  to store as elements in the collection
* The URL path on the server that represents the posts collection resource in the REST API

Define the post view
####################

Open the ``views/index.tpl`` file. Look at lines 45 through 50 in the file. This section contains markup for an Underscore_ template. When rendered as HTML, it will display the body, vote count, and timestamp of a post model on the kvetching board.

Now open the ``public/js/views/post-view.js`` file. Look for the call to ``Backbone.View.extend``. Populate its object with the following properties to use the Underscore template as the view for a post:

.. code-block:: javascript

   app.PostView = Backbone.View.extend({
      // html tag to use for each post
      tagName: 'div',
      // css class name to use on each post
      className: 'post',
      // template to use for each post
      template: _.template($('#post-template').html()),

      render: function() {
         // TODO
      }
   });

Look in the Backbone documentation in the View section and the Underscore doc for the ``template`` function to understand what these properties mean. Once you do, implement the ``render`` function so that it does the following:

1. Renders the Underscore template as HTML using the properties of ``this.model`` (Hint: Look in the Underscore doc for an example of how to render the template.)
2. Puts the rendered HTML on the page in the HTML element bound to the view. (Hint: Look in the Backbone doc for the view instance variable name containing a reference to the element on the page.)
3. Returns the view instance for use by the caller of the ``render`` function. (Big Hint: ``return this;``.)

Define a list of posts view
###########################

Open the ``public/js/views/posts-view.js`` file. Look for the call to ``Backbone.View.extend``. Populate its object argument with the following functions:

.. code-block:: javascript

   app.PostsView = Backbone.View.extend({
      initialize: function(options) {
         // reference to the posts collection
         this.posts = options.posts;

         // listen to add and reset events on the collection
         this.listenTo(this.posts, 'add', this.on_add_one);
         this.listenTo(this.posts, 'reset', this.on_add_all);

         // force the collection to fetch exists 
         this.posts.fetch({reset: true});
      },

      on_add_one: function(post) {
         // TODO
      },

      on_add_all: function() {
         this.$el.html('');
         this.posts.each(function(post) {
            this.on_add_one(post);
         }, this);
      }
   });

Review the ``Backbone.View`` documentation about the ``initialize`` and ``listenTo`` functions. Understand when Backbone will invoke the ``on_add_one`` and ``on_add_all`` callback functions.

Now implement the ``on_add_one`` function so that it does the following:

1. Creates a new instance of a ``app.PostView`` and passes it the ``post`` argument as the ``model`` for the view.
2. Calls the ``render`` function on the view instance and appends the result to this view's (the ``app.PostsView``) element. (Hint: Did you find the documentation about where a view stores its element reference?)

Put it all together
###################

At this point, you've created a simple post model, a post collection, a view for a post, and a view for a collection of posts. Now you need to wire all these pieces together in an application view.

Open the ``views/index.tpl`` file again. Find the following:

* The ID of the &lt;input&gt; element.
* The ID of the submit &lt;button&gt; element
* The ID of the &lt;div&gt; under the *Latest* heading.

Now open the ``public/js/views/app-view.js`` file. Add the following to it. Then handle the TODOs in the code using the Backbone documentation and the element IDs you looked up in the ``index.tpl`` file.

.. code-block:: javascript

   app.AppView = Backbone.View.extend({
      el: '#app',

      events: {
         // TODO: register for click event on submit button and call on_submit
         // TODO: register for keypress event on the input element and call on_keypress
      },

      initialize: function() {
         // get a jQuery reference to the input element
         this.$input = $('#input');

         // TODO: create a new instance of the app.Posts collection
         //       and store it in an instance variable
         // TODO: create a new instance of the app.PostsView bound
         //       to the latest column, with a reference to the 
         //       posts collection
      },

      on_submit: function() {
         // get the input text
         var val = this.$input.val().trim();
         if(val) {
            // TODO: create a new post in the collection with the 
            // value as the body of the post

            // reset the text box to empty
            this.$input.val('');
         }
      },

      on_keypress: function(e) {
         // invoke submit when user presses enter
         if(e.which === app.ENTER_KEY) {
            this.on_submit();
         }
      }
   });

When you're done, start the web server again if it isn't already running and refresh the browser page. If everything is working, you should be able to submit a new post and see it appear in the list of latest posts. Also, if you refresh the page or restart the server, you should still see all your posts.

Like in our jQuery session, if you hit problems, use the Chrome Developer Tools (or equivalent in your browser of choice) to debug the problem.

Show the timestamp
##################

When the user adds a new post, Backbone sends the post body to the server for inclusion in the application database. The server backend inserts the post body, current date and time, and initial vote count (zero) in the database. It responds with all of this information plus the unique ID of the post, namely the ``rowid`` from the database.

Update the ``app.PostView`` to listen to this server response. When received, re-render the post so that it includes the server generated information. (Hint: Look in the Backbone documentation for the model event the view needs to ``listenTo``.)

Support post upvotes
####################

Supporting upvotes requires changes in both the post model and view.

* Add an event listener to ``app.PostView`` for clicks on the *+1*.
* Add an event callback that invokes an ``upvote`` function on the post model for the view.
* Add the ``upvote`` function to the ``app.Post`` model that uses jQuery to POST an empty request to ``/upvote`` on the server.
* Add a success callback to the jQuery AJAX request that updates the vote count on the model to the ``response.votes`` count the server returns.
* Add a listener to the ``app.PostView`` that updates the ``#count`` element in the view when the model's ``vote`` property changes.

Play with the application a bit once you get all this working. Is there any other logic you should add to the upvote feature? (Hint: How many upvotes should a user get?)

Define a favorites collection
#############################

With the app receiving upvotes, it's now possible to show a collection of favorite posts: those with the most upvotes. Create a new ``app.Favorites`` collection that extends ``app.Posts``. Point it to the ``/favorites`` URL of the server. Then instantiate a new ``app.PostsView`` in ``app.AppView``. Pass this instance a reference to the ID of the favorites column in the page template and a reference to the favorites collection instance.

If all goes to plan, you shouldn't need to make any other changes. Why? (Hint: Are you getting benefits from reuse?)

Sort the favorites by votes
###########################

Per the requirements, the favorites view should sort its posts from most votes to least. Add the necessary logic to make this happen to the ``app.Favorites`` collection. Then add an event listener to the ``app.PostsView`` that orders the post views accordingly. (Hint: Backbone supports sorting via a model ``comparator`` function. The harder part is getting the views sorted properly after the collection sort.)

Keep the views consistent
#########################

A given post may appear twice on the page, both in the latest and favorites columns. If you upvote one of these posts, you'll notice that its counterpart does not update accordingly. Ideally, it should. 

Currently, if a post appears in two columns, it means two post views are attached to two separate model instances representing the same post. Instead, we want the two views to share the same post model instance representing the post. You can accomplish this change by overriding how Backbone constructs new post instances and checking if an instance already exists for a given post ``rowid``. If it does, you should reuse that instance instead of creating a new one.

(Hint: I overrode the ``constructor`` for ``app.Post``.)

Ask for my version
##################

I do have a local git branch with a version of the Kvetch app meeting all the requirements set forth on this page. If you put significant effort into building the app, but get stuck, talk to me and I'll share my version with you. I will ask to see what you've done before I hand over my solution, however.

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

TotT gamification
#################

I'd really like to recognize students as they complete exercises or projects throughout the TotT sessions. A web site that gamifies TotT might be cool. For instance, if you attend 10 sessions in a row, perhaps you receive the *Omnipresent* badge. If you attempt all the bash exercises, maybe you get the *Bash basher* badge. If your NodeJS dead-drop passes a set of tests you get the *007* badge. You get the idea. 

The difficulty with such an undertaking is in the validation of achievements. How would the site know a student attended 10 sessions, tried all the bash exercises, and passed all dead-drop unit tests? I think all of these are solvable, but leave it to you to come up with creative solutions.

If you do, design and implement such a site using Backbone or another MV* framework. I'll gladly host it somewhere if you succeed.

References
----------

`TodoMVC <http://todomvc.com/>`_
    A TODO list web app implemented in numerous MV* frameworks (and not)with all of their source on GitHub for educational purposes

`Backbone Tutorials <http://backbonetutorials.com/>`_
    A collection of Backbone related tutorials

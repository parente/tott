MV* and Backbone
================

Goals
-----

* Learn a bit about MVC, MVP, MVVM, etc. design patterns
* Learn the basic concepts of the Backbone_ framework
* Recognize the MV* pattern in Backbone
* Understand how Backbone can help structure client-side code
* Practice writing web applications using Backbone

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Read the `Wikipedia Model-view-controller article <http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller>`_ (~10 minutes)
* Read `the Introduction section of the Backbone doc <http://backbonejs.org/#introduction>`_ (~5 minutes)
* Read `Why you should use MV* front-end frameworks like Backbone, Ember, and Angular <http://maximilianschmitt.me/blog/web-development/why-you-should-use-mv-front-end-frameworks-like-backbone-ember-and-angular/>`_ (~10 minutes)
* Read `the annotated Todos.js Backbone example code <http://backbonejs.org/docs/todos.html>`_ (~15 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Clone the Kvetch project
########################

Understand the requirements
###########################

Understand the components
#########################

Define a post model
###################

Define a posts collection
#########################

Define the post view
####################

Define the latest posts view
############################

Instantiate everything
######################

Rest and compare it with jQuery
###############################

Support post upvotes
####################

Define a favorites collection
#############################

Instantiate favorites
#####################

Keep the views consistent
#########################

Sort the favorites by votes
###########################

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

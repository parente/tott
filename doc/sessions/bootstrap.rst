HTML, CSS, and Bootstrap
========================

Goals
-----

* Define HTML5
* Learn about HTML markup
* Learn about CSS styling
* Understand HTML and CSS work together
* Understand the pros and cons of Bootstrap
* Practice creating basic HTML / CSS sites
* Practice using Bootstrap_ to build web sites quickly

Introduction
------------

TODO: intro and slidecasts

If time permits, review these additional pages:

* Skim the `HTML5 article <http://en.wikipedia.org/wiki/HTML5>`_ on Wikipedia. (~15 minutes)
* Read Chapters 1 through 4 of `CSS Basics <http://www.cssbasics.com/introduction-to-css/>`_. (~10 minutes)
* Read the `HTML Dog Beginner Tutorial <http://www.htmldog.com/guides/html/beginner/>`_. (~10 minutes)
* Read the `Bootstrap article <http://en.wikipedia.org/wiki/Bootstrap_(front-end_framework)>`_ on Wikipedia. (~10 minutes).
* Read `Building Twitter Bootstrap <http://alistapart.com/article/building-twitter-bootstrap>`_. (~15 minutes)
* Read `Bootstrap without all the debt <https://coderwall.com/p/wixovg>`_. (~10 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Run a tiny web server
#####################

Create a project folder in the *tottbox* shared directory. On *tottbox*, change to that directory and run ``python -m SimpleHTTPServer``. Back on your host machine, open your web browser and visit http://192.168.33.10:8000. You should see an empty directory listing.

(Re-)design the TotT web site
#############################

Create a simple HTML web page for the TotT meet-up in the ``index.html`` file in your project folder. Use the content on the current front-page of the TotT meet-up site or make up your own description. Use appropriate HTML5 tags to indicate headings, sections, navigation, and so on. Make sure it renders properly in your browser. Don't spend much time on making it look spiffy yet.

Get Bootstrap
#############

Download the assets from the Bootstrap site. Or, get fancy and try using a frontend package manager like `bower`_. Your choice. In either case, get the Bootstrap CSS and JS files into the project folder you created.

Style your page with Bootstrap
##############################

Add the Bootstrap CSS and JS to your ``index.html``. Refresh your browser and make sure you see the Bootstrap typography styles take hold.

Now design a layout for the page content that highlights the key facts about the meet-up. Use appropriate styles and components from Bootstrap to do so. For example, you might consider using the grid feature to put simple summaries of what, when, and where `above the fold <http://en.wikipedia.org/wiki/Above_the_fold>`_ instead of one after the other down the page.

Try it on mobile
################

If you have a mobile device, try visiting your site on it. If you want to keep it running on *tottbox* and visit it there, you'll need to modify your *tottbox* Vagrantfile to forward port 8000 on your *tottbox* VM to your host machine and ``vagrant reload`` your VM. Then you'll need to visit the IP address of your host box in your web browser to view it.

Alternatively, if you have a Dropbox account or other static site hosting, you can dump your site there and view it on your mobile.

Apply a new theme
#################

Switch the Bootstrap theme to one of the `free offerings from Pixelkit <https://github.com/Pixelkit/PixelKit-Bootstrap-UI-Kits>`_. Follow their instructions on how to make the change.

Add CSS3 eye-candy
##################

Learn about CSS3 transitions, transforms, and animations by searching the web. Think about where you might apply such eye-candy tastefully on the TotT site. Then try your hand at adding the feature. For example, you might try transitioning in more details about any of the basic facts about the meet-up when the user mouses over the initial text. (Hint: Check out `these original hover effects <http://tympanus.net/Tutorials/OriginalHoverEffects/index3.html>`_ for inspiration.)

Ensure keyboard accessibility
#############################

Try navigating the page you built using the keyboard alone. Learn the basic keyboard navigation commands for your browser and OS. Try moving focus among the interactive elements you added to the page (e.g., buttons, links). Try activating all of them. Are there any holes? If so, fix them. (Hint: Did you add mouseovers? Can you trigger them without a mouse?)

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

Revisit the dead-drop
#####################

If you attended the :doc:`Express and Jade <express>` meet-up, use Bootstrap to style your dead-drop web app.

References
----------

`HTML5 Rocks <http://www.html5rocks.com>`_
    Tutorials, articles, demos, and sample code for HTML5 related technologies

`Dive Into HTML5 <http://diveintohtml5.info/>`_
    "... elaborates on a hand-picked selection of features from the HTML5 specification and other fine standards."

`Can I use ... <http://caniuse.com/>`_
    Browser compatibility tables for HTML5 and related features
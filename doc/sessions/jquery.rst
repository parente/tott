JavaScript and jQuery
=====================

Goals
-----

* Learn about the browser DOM
* Learn about AJAX
* Know what jQuery_ is
* Understand the history of jQuery
* Practice traversing and manipulating the DOM with jQuery
* Practice invoking REST APIs with jQuery
* Use the basic panels of the Chrome Developer Tools

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Skim `DOM Introduction <https://developer.mozilla.org/en-US/docs/DOM/DOM_Reference/Introduction>`_ on the Mozilla Developer Network site (~15 minutes)
* Read the `AJAX Wikipedia article <http://en.wikipedia.org/wiki/Ajax_(programming)>`_ (15 minutes)
* Read the `jQuery Wikipedia article <http://en.wikipedia.org/wiki/JQuery>`_ (10 minutes)
* Skim some `jQuery Examples and Best Practices <http://coding.smashingmagazine.com/2008/09/16/jquery-examples-and-best-practices/>`_ (~15 minutes)
* Skim `5 Ways to Make Ajax Calls with jQuery <http://net.tutsplus.com/tutorials/javascript-ajax/5-ways-to-make-ajax-calls-with-jquery/>`_ (~15 minutes)
* Read `Introduction to Chrome Developer Tools, Part One <http://www.html5rocks.com/en/tutorials/developertools/part1/>`_  on HTML5 Rocks (~30 minutes)
* Read `Do You Really Need jQuery? <http://www.sitepoint.com/do-you-really-need-jquery/>`_ (~10 minutes)
* Solve some of the problems on `tryJQuery <http://try.jquery.com/>`_

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Clone the ShortSheet project
############################

I've seeded a project called ShortSheet (SS) on GitHub at https://github.com/parente/tott-shortsheet. It is a starting point for building a basic spreadsheet web application. We will build out this application throughout the following exercises.

To get started, clone SS to your *tottbox* shared folder. Start a bash session on *tottbox*, change to the project directory, and run ``make build``. The build will download dependencies of the project, namely Bottle_, jQuery, and Bootstrap. When the build completes, run ``make server`` in the same directory. Then visit ``http://192.168.33.10:8080``` in your browser.

Spend a few minutes looking at the application UI and its structure on disk. Open the ``Makefile`` in the root of the project and look at its contents. What did ``make build`` and ``make server`` do? Open the ``public/index.html`` file. What does it contain? How about the ``public/vendor`` folder? The ``public/js/shortsheet.js``? Share what you find.

Add CSV file import
###################

Right now, the SS shows a sample set of data and nothing more. An *Import* button exists at the top of the page. Clicking it shows a file picker. Selecting a file causes no change. Yet.

Open the ``shortsheet.js`` file. Find the ``TODO`` comment about supporting import. Add code using jQuery that attaches a ``change`` event handler to the ``import-csv'`` file input element and invokes the function mentioned in the comment. (Hint: Look in the jQuery doc.)

`Save this second sample CSV file <https://gist.github.com/parente/7965617/row>`_ with a ``.csv`` extension on your machine. Try importing it into your spreadsheet. The spreadsheet should render the new data if your code is working properly. 

If you hit problems, use the Chrome Developer Tools (or equivalent in your browser of choice) to debug the problem. (Hint: Adding simple ``console.log`` statements to your code and looking for their output in the developer tools *Console* tab can go a long way.)

Make cells editable
###################

The SS cells are read-only at the moment. We want to make them editable so that you can change values and, later, enter formulas.

Look for the ``TODO`` comment about making cells editable in the ``shortsheet.js`` file. Add code using jQuery that listens for double click events on all cells in the spreadsheet table (i.e., all <td> HTML elements in the <tbody> element). In the event listener function, set the ``contenteditable`` attribute on the clicked table cell to ``true``. Then give the cell keyboard focus. (Hint: Again, use the jQuery doc or Google.) 

If your code is working properly, the browser will highlight the cell, show a text caret in it, and let you edit its content.

Make cells read-only again
##########################

Allowing edits to a cell is only half the battle. You must also add code to take the cell out of edit mode when you want to cease editing. There are many ways you might do so. Handle two of them for now.

1. If you double click another cell while in editing mode, the current cell should become read-only and the newly clicked cell should be editable.
2. If the you press the Enter key, the current cell should become read-only.

Again, use jQuery to set event handlers for these conditions. Tracking which cell is currently in editing mode in a variable might help in resetting it.

Support adding rows and columns
###############################

The spreadsheet is still pretty static at the moment. The row and column count is fixed at the dimensions of the data you loaded. Add UI to allow addition or removal of rows and columns. Add the appropriate jQuery event handlers to monitor for these elements. When an event occurs, add the appropriate HTML elements:

* For a row, add a <tr> containing a number of <td> elements equal to the current number of columns.
* For a column, append a <td> element to each row <tr> element currently in the table.

Start by supporting additions at the end of the last row or column. Once you have that code working, consider changing the UI and code to support additions anywhere in the sheet.

Support cell formulas
#####################

All spreadsheets have support for formulas. Think about a syntax for  arithmetic operations in ShortSheet. Maybe a subset of JavaScript? Maybe something custom? Should it support individual cells? Cell ranges?

Add code to ``shortsheet.js`` to parse and execute formulas when a cell changes from editable to read-only. Store the formula in a ``data-formula`` attribute on the cell. Parse and execute the formula. Store the result of the formula in the cell itself. 

Re-evaluate any formulas in the sheet whenever a new row or column is added. Change the CSV loading code to add any formulas present in the CSV as ``data-formula`` attributes and evaluate them all.

Consider editing the ``sample.csv`` file to include a few formulas to test your code.

Think about your design
#######################

Take a moment and think about the data model of SS. What happens when you want to implement support for saving a spreadsheet? How would you gather up the formulas and plain, old values? Does storing everything in the HTML make things hard in the long-term? (Hint: This is the topic we'll address in the :doc:`backbone` session.

Support row and column removal
##############################

Add UI and code for removing entire rows and columns from the spreadsheet. Remember to re-execute any formulas after adding either. (Hint: Have you put the code for formula execution in its own reusable function yet?)

Add CSV URL import
##################

Looking back, it's silly that you had to download a CSV file from a GitHub Gist just to load it from your local machine into your web browser. Why not just fetch it directly from the Gist URL?

One complicating factor is that JavaScript running in a web browser can only send requests to the same origin that served up the HTML page that includes it. This security precaution is known as the `same origin policy <http://en.wikipedia.org/wiki/Same-origin_policy>`_  and is meant to prevent `cross-site scripting attacks <http://en.wikipedia.org/wiki/Cross-site_scripting>`_. Web applications have ways of working around this limitation, one of is to simply make such requests on the server side, not the client-side.

The Python web server hosting the SS web assets already has a ``/gist/:userid/:gistid`` resource. Sending an HTTP GET request to this resource with a valid GitHub username and Gist ID will cause the server to respond with the raw text of the Gist.

Add elements to the ShortSheet UI to collect this information, and a trigger to send it to the Python server. Add jQuery code to listen for the trigger event and to send a GET request (AJAX request) with the requisite information. Populate the spreadsheet with the response CSV in the same manner as when the file existed locally.

Test your code with the gist you downloaded previously with user ID ``parente`` and gist ID ``7965617``. Or choose another CSV gist located on GitHub as a test.

Add more features
#################

Consider other features most spreadsheets have (or don't have). Implement whatever you wish. Here are some starting ideas.

* Show errors loading spreadsheets, evaluating formulas, and so on using Bootstrap alerts.
* Support column and row sorting by value.
* Support column and row re-ordering via drag and drop.
* Support keyboard navigation of the sheet.
* Support more formula operations.
* Support progressive loading of large CSV files.
* Set columns to a fixed, but adjustable, width.
* Allow users to download modified sheets as CSV files.
* Add spreadsheet persistence on the server side.
* Make sheet display more attractive with better styling.
* Show a busy spinner while loading data.

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

Stateless Book Builder
######################

See `Gary's Stateless Server Idea <http://cs.unc.edu/~gb/blog/2013/06/14/stateless-server-idea/>`_ blog post.

Slidecast Framework
###################

Pete hacked together `a little JS module <>`_ for `reveal.js`_ to support the self-narrating slidecasts you see on the TotT session pages. Extract this code out of the `TotT GitHub repository <>`_ and migrate it to its own repo. Then spend some time cleaning it up, making it more general purpose, and documenting it so others can use it to build their own slidecasts.

Hosted Slidecasts
#################

Take the slidecast framework mentioned above and build a cloud-hosted version. One approach could be:

1. A user signs in.
2. The user links her slidecast account to her DropBox accounts.
3. The user enters Markdown_ to construct her slides.
4. The user records audio right on the site via the `HTML5 getUserMedia API <http://www.html5rocks.com/en/tutorials/getusermedia/intro/>`_.
5. The site persists the slideshow in the user's DropBox account.

This project would be a large undertaking, but unique on the web at the moment, as best as I can tell. 

References
----------

`Learn jQuery <http://learn.jquery.com/>`_
    Explanations, workarounds, best practices, how-tos

`Chrome Developer Tools Documentation <https://developers.google.com/chrome-developer-tools/>`_
    Official documentation from Google
Gulp.js
=======

Goals
-----

* Learn what a task runner is
* Learn how to install gulp and access gulp plugins
* Edit an example gulp file to build an example project

Prep Materials
--------------

If time permits, try to review some of these resources before the meet-up. If you can't, come anyway!

* Watch `this video on using Grunt <http://vimeo.com/65014958>`_ (~2 minutes): You don't need to watch all of it, but it gives a good idea of what a task runner does. Gulp.js solves the same problems, so the first two minutes are still useful.
* Make sure you feel somewhat comfortable with npm, nodejs, and javascript before attempting this. Some knowledge of jade and markdown can help too.
* Read `this simple tutorial <http://robo.ghost.io/getting-started-with-gulp-2/>`_ (~5 minutes)

Introduction
------------

So why should we care about task runners? Well, currently front-end development requires a lot of build tasks. We need to minify css/html, compile templates, compress images, compile typescript/coffeescript/dart/sass/less/stylus files, and do all kinds of other things. Task runners can automate all of these tasks. Once you configure a task runner, it can save you huge amounts of time.

Exercises
---------

Gulp.js is a new task runner that automates repetitive build tasks. It can automate the process of linting your javascript, compressing images, and many other common tasks.

Install Gulp.js
###############

The first step is to install the `gulp <https://npmjs.org/package/gulp>`_ npm package globally. If you aren't sure how to do this, enter ``npm help install`` or ask for help.

This session will involve an example project for you to work with. If you already have a website or some kind of web related project (your project should probably have something to do with front-end web dev), you can try to integrate gulp into your project instead of using my example project. If you want to use the example project, just git clone `this repository <https://github.com/Coalman/tott-gulpjs>`_. Make sure to read the project's readme to get a sense of the folder structure and complete the initial setup.

Copy Bootstrap css files
########################

After running ``bower install``, you should notice a ``bower_components`` folder. In the ``gulpfile.js`` file, you should see a function that looks like this::

    gulp.task('vendor', function() {
        console.log('Edit the gulpfile.js file!');
    });

Implement this function to copy the ``bower_components/bootstrap/dist/css/bootstrap.css`` file to the ``dist/vendor`` directory (gulp will create this directory for you if it is not already there). You may find the following link useful: `gulp api <https://github.com/gulpjs/gulp/blob/master/docs/API.md>`_.

Render Jade Templates
#####################

If you read the example project ``readme.md``, you'll know that the ``src/`` directory has some ``.jade`` files. It's time to compile these files into html. Inside the ``gulpfile.js`` file you should notice a `build` gulp task. Implement this function to use the jade plugin to compile the ``src/*.jade`` files to ``dist/``.

If you want to preview the html files after they are created, feel free to use the `http-server <http://tott-meetup.readthedocs.org/en/latest/sessions/vagrant.html>`_ utility we installed in an earlier meetup to view the files.

Pass data to the Jade Templates
###############################

If you viewed the files, you'll notice a pleasant Domo. Lets change that. If you did the last exercise correctly, you will have a line like this::

    .pipe(jade())

Unfortunately, this step is not well documented on the ``gulp-jade`` repository so I'll walk you through it. The ``jade`` function can take an object with some options, one of them is a ``data`` option that my templates can use to generate the html with something other than a pleasant domo. The following code snippet is similar to what your code should look like after this exercise::

    .pipe(jade({
        data: {
            title: 'About Me',
            name: 'Michael Coleman', // use your own name, this one is mine :P
            portrait: 'url to a pic of you', // more on this in a bit
            github: 'https://github.com/Coalman', // use your own github url
            email: 'your email address'
        }
    }

There is an interesting choice to make when it comes to your portrait. You could choose to use gravatar (github uses this service to get your github profile picture) to generate the url of your gravatar portrait or insert the link here manually. It's purely up to you to choose.

Also, feel free to change the `markdown <http://daringfireball.net/projects/markdown/>`_ text in the ``index.jade`` file to say a little bit about yourself!

Setup Local Web server
######################

I've included a small static file server using ``express.js`` in the ``preview.js`` file in the root folder. It's been imported to the ``preview`` variable in your gulpfile. If you call the ``listen`` function on this ``preview`` object (and pass in a port number), it will serve your files locally. I recommend putting this code in the ``server`` gulp task.

Watch files and LiveReload
##########################

This exercise is a bit challenging. When you make changes to the jade files, you have to manually run ``gulp build`` to see the changes. Use gulp.watch in the gulpfile to rebuild the jade files when a change is detected.

Also, you can setup livereload to refresh your browser when these files are rebuilt. You may find `this link <http://robo.ghost.io/getting-started-with-gulp-2/>`_ helpful.

Compress your HTML, CSS, and Image files
############################

This exercise is a bit challenging. There is a gulp plugin called `gulp-gzip <https://npmjs.org/package/gulp-gzip>`_ that will gzip your files. Use this plugin to compress your generated html/css files. This will reduce the size of the files which decreases bandwidth usage and increases transfer speed. You can `read this <http://betterexplained.com/articles/how-to-optimize-your-site-with-gzip-compression/>` for more information on why you should compress your assets.

References
----------

`Gulp.js <http://gulpjs.com/>`_
    The official website.

`Gulp.js plugins <http://gratimax.github.io/search-gulp-plugins/>`_
    List of gulp.js plugins. If you don't see one you need here, consider writing one. If you don't need to interact with a stream, you could consider looking for normal npm modules that could be adapted or used.

`Gulp.js docs <https://github.com/gulpjs/gulp/tree/master/docs>`_
    Official docs. At the time of writing, they are a tad small, but there are examples in the repository. It's documented well enough.
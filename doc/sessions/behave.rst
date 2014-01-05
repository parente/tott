BDD and Behave
==============

Goals
-----

* Define test driven development (TDD)
* Define behavior driven development (BDD)
* Understand the use cases for Gherkin
* Understand the red-green-refactor cycle
* Practice reading and writing spec with Gherkin
* Practice BDD with Behave

Prep Materials
--------------

If time permits, try to review these resources before the meet-up. If you can't, come anyway.

* Skim `Test-driven Development <http://en.wikipedia.org/wiki/Test-driven_development>`_ on Wikipedia. (~20 minutes)
* Skim `Behavior-driven Development <http://en.wikipedia.org/wiki/Behavior-driven_development>`_ on Wikipedia. (~20 minutes)
* Read the `Gherkin <https://github.com/cucumber/cucumber/wiki/Gherkin>`_ wiki page in the CucumberJS project. (~5 minutes)
* Read the `Behave tutorial <http://pythonhosted.org/behave/tutorial.html>`_. (~20 minutes)
* Read `Cucumber: When to Use It, When to Lose It <http://pivotallabs.com/cucumber-when-to-use-it-when-to-lose-it/>`_ and `Please don't use Cucumber <http://www.jimmycuadra.com/posts/please-don-t-use-cucumber>`_ . (~10 minutes)

Exercises
---------

You will need to complete the :doc:`/setup` instructions before you proceed with these exercises. Once you are set up, SSH into *tottbox* using the ``vagrant ssh`` command from the setup instructions. Then tackle the problems below. `Document what you find in a gist <https://gist.github.com/>`_ and share it in the `TotT community`_ later.

Read the rules of RPSLK
#######################

`Rock-Paper-Scissors-Lizard-SpocK <http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock>`_ is an extension of the classic rock-paper-scissors game. Read and understand the rules.

Gather requirements
###################

Imagine I am paying you to implement a version of this game in Python. The game should declare a winner of the best of 5 rounds. In each round, the game should prompt the user to choose a gesture. The game should then generate a random gesture of its own and report the winner of the round, computer or human. If the round results in a tie, it should not count toward the 5 round limit and should be replayed. The game should announce the winner as soon as the victory is decided (e.g., the first player to win 3 rounds wins the game).

The game should work at the command line for now. Later, I might decide to port it to the web. I need you to design the game to make this port easy. I ask that you separate the game logic (model) from the CLI (view and controller). Two separate modules, ``model.py`` for the game logic and ``rpskl.py`` for the CLI the user runs, should do the trick.

Bootstrap the project structure
###############################

Create the following simple project layout on disk in new shared folder called ``rpslk``::

    rpslk/
        features/
            steps/
                model.py
                cli.py
            cli.feature
            environment.py
            model.feature
        model.py
        rpslk.py

Initialize a git repository there and git commit the empty files as a seed. Commit your work as you move through these exercises.

Write model.feature
###################

Given the requirements above, write the Gherkin feature file for the game model including the scenarios below. Use the three completed scenarios, the examples in the Behave documentation, the `feature tests you ran when setting up tottbox <https://github.com/parente/tott-verify/tree/master/features>`_, and any other Gherkin examples you can find on the web as references. Don't spend too much time on them now as you will tighten them up when you start writing the test code.

.. code-block:: gherkin

    Feature: RPSLK game logic

        Scenario: User inputs a supported gesture RPSLK
            Given a user gesture
            When the game processes the round
            Then it returns the result of the round

        Scenario: User beats computer in a round
            # TODO

        Scenario: Computer beats user in a round
            # TODO

        @wip
        Scenario: User and computer tie in a round
            Given the user gesture
                | rock    |
                | paper   |
                | scissors|
                | lizard  |
                | spock   |
            And the computer gesture is the same
            When the game processes the round
            Then it reports the result as a "tie"


        Scenario: User wins the whole game
            Given the user has won 2 rounds
            And the user gesture is "rock"
            And the computer gesture is "scissors"
            When the game processes the round
            Then it indicates the user has won the game

        Scenario: Computer wins the whole game
            # TODO

Test the syntax of your feature file by doing the following on *tottbox*

.. code-block:: console

    cd /vagrant/rpslk
    behave

The command should output your scenario text and mark each one failing because it is not yet implemented. It will also give (poor) code samples you can use to start implementing the test cases. Have a look at them and then move on. (I say poor because behave makes every test step explicit without considering test code reuse. Other libs are better at these suggestions.)

Test and implement one scenario
###############################

Add the following test code to your ``features/steps/model.py`` file. It completely implements the *User and computer tie in a round* scenario test case. Read the docstrings for each function to get an idea of what is going on.

.. code-block:: python

    from behave import given, when, then

    @given(u'the user gesture {gesture}')
    def step_impl(context, gesture):
        '''
        Store the user's gesture in the context for later steps.
        '''
        context.user_gesture = gesture


    @given(u'the computer gesture is the same')
    def step_impl(context):
        '''
        Dictate that the game Model instance must have a method named
        generate_gesture() that will return the random computer gesture for the
        round. Replace that method here with a function that returns the
        same gesture as the user gesture. This is called "mocking".
        '''
        context.model.generate_gesture = lambda: context.user_gesture


    @when(u'the game processes the round')
    def step_impl(context):
        '''
        Dictate that the game Model instance must have a method named
        process_round() that takes the user gesture for the round as a parameter.
        Save the return value in the context for later steps.
        '''
        context.result = context.model.process_round(context.user_gesture)


    @then(u'it reports the result as a {result}')
    def step_impl(context, result):
        '''
        Assert that the result of the round matches what the spec stated should
        happen.
        '''
        assert context.result == result

Notice that ``context.model`` is assumed to exist. That is, the test steps assume a game model is available for testing. We can ensure this is the case for each scenario by adding the following code to the ``features/environment.py`` file.

.. code-block:: python

    from model import Model

    def before_all(context):
        context.model = Model()

For this import to succeed, you must add a class named ``Model`` to the ``model.py`` file in the root of the project. Add the following empty class to that file.

.. code-block:: python

    class Model:
        pass

Now run ``behave`` in ``/vagrant/rsplk``. Notice the lengthy output. Somewhere near the top you should see *When the game processes the round* in red ink and below that a stack trace indicating that the ``process_round()`` method is missing.

Welcome to the red-green-refactor cycle! You now have a red test. Your goal is to turn it green by fixing the implementation.

Implement the shell of the missing method and run ``behave -t @wip`` again. If you got the message signature right, that line of text should become green and the next one should show red. If not, the line will remain red but the stack trace will change. Continue in this fashion until the entire scenario is green. (Hint: Implement a ``generate_gesture()`` method for ``process_round()`` to invoke and the test to mock. Then add the game logic to compare the user and generated gesture in ``process_round()``.)

Learn about behave options
##########################

Have a look at ``behave --help``. Investigate the use of tags such as ``@wip`` and the various formatting options of behave. Customize your future invocations of ``behave`` to suit your liking.

Test and implement the other scenarios
######################################

(Re)Using the above test steps, the Behave documentation, `steps you ran to verify your tottbox setup <https://github.com/parente/tott-verify/tree/master/features>`_, and examples you find on the web, test and implement the remaining scenarios. Work each one as a pair: first write the test code, then code the implementation, and then debug the test/implementation pair. When the test passes, move onto the next scenario, refactoring your game or test code when needed.

Don't forget to move the ``@wip`` to the current scenario you're working or remove it all together when you're done.

Fill the gaps
#############

Review your game model scenarios, tests, and implementations. Can you think of any other behaviors that your spec should capture or your test cases check? If so, spec, test, and implement them if you haven't already. (Hint: Can anything go wrong?)

Spec, test and implement the CLI scenarios
##########################################

At this point, you have an API for the RPSLK game, but you have no user interface. You need to implement the CLI. Write the scenarios, tests, and implementation for the CLI following the pattern you practiced for the game model. (Hint: Keep it simple.)

Document your experience
########################

What are the pros and cons of behavior-driven development? Test-driven development? Gherkin? When might you follow this process to a T? When might you seek "shortcuts"? What are some alternative workflows you might envision?

Projects
--------

If you want to try your hand at something larger than an exercise, consider one of the following.

Compare Behave with unittest
############################

Look into the classic `unittest <http://docs.python.org/2/library/unittest.html>`_ package in the Python standard library. Try porting a few tests to it. What are the differences? When might you use one over the other? Write about it.

Port it to JavaScript and Mocha
###############################

`Mocha`_ is a highly popular test framework for JavaScript. It is a unique blend of specification and test implementation that "feels right" in JavaScript.

Port your specs, tests, and implementation from Behave and Python to Mocha and JavaScript. Document your experience. What's different due to language? Library? Test philosophy? What's the same?

References
----------

Behave_
    Behavior-driven development, Python style

`CucumberJS <https://github.com/cucumber/cucumber-js>`_
    A port of the Cucumber BDD library from Ruby to JavaScript

`Mocha`_
    Test-driven development, JavaScript style


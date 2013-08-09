# COMP XXX: Tools of the Trade

This repository hosts the web site and related materials for a proposed course on software development tools.

From the website:

> Tools of the Trade (TotT) is an elective course for students who want more exposure to the wide variety of tools used in modern software development. The goal of this course is to build student confidence in finding, learning, applying, and evaluating tools through practice. Students will prepare for class by reading and/or watching lectures online about version control, web development, data analysis, dynamic languages, and so on. Students will apply what they have learned in collaborative, hands-on, in-class sessions. Students will integrate the tools and topics introduced in small to moderate sized programming assignments throughout the course as well as a final project.

## Contents

```
/
    doc/                # course website, reST / Sphinx
        assignments/
        sessions/
        slides/         # deck.js format presentations
    packer/
        scripts/        # scripts for provisioning
        tottbox.json    # packer config for building student dev env
    vagrant/
        Vagrantfile     # vagrant config for managing student dev env
    Makefile            # automate all the things
```

## Fork This Course

I plan to build out the material for this course entirely in the public eye. The source for the course web site, code samples, student Vagrant box, lab exercises, assignment starter templates, and so on all live or will live under http://bitbucket.org/unctott/tott. If you have a suggestion or see a problem, `open an issue <https://bitbucket.org/unctott/tott/issues>`_ or `fork and submit a pull request <https://bitbucket.org/unctott/tott/fork>`_.

## License

MIT
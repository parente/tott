# Tools of the Trade

This repository hosts the web site and related materials for a series of meet-ups about software development tools.

From the website:

> Tools of the Trade (TotT) is a recurring meet-up for students who want more practice finding, learning, applying, and evaluating tools used in modern software development. The goal is to build experience and confidence in a friendly, fun, collaborative environment. Every week we will:

> 1. Pick a tool or topic of interest (e.g., Git, Ruby, Backbone, Pandas, BDD, ...)
> 2. Do a bit of background reading or video watching about our choice to prep for our meeting.
> 3. Meet face-to-face to hack on practice problems or small projects together in a common development environment.
> 4. Help one another and share our experience in person and online.

## Contents

```bash
/
    doc/
        sessions/       # meetup material Sphinx / reST source
        slides/         # slidecast Jade source
    packer/
        tottbox.json    # packer config for building common dev env
        tottbox_32.json # because an early ver of packer couldn't handle 1 conf
    vagrant/
        Vagrantfile     # vagrant config for managing common dev env
    Makefile            # automate all the things
```

## Fork This Course

I plan to build out the material for our meetings entirely in the public eye. The source for the course web site, code samples, shared Vagrant box, lab exercises, and so on all live or will live under [http://github.com/parente/tott](http://github.com/parente/tott). If you have a suggestion or see a problem, [open an issue](https://github.com/parente/tott/issues) or [fork and submit a pull request](https://github.com/parente/tott/fork).

## License

MIT

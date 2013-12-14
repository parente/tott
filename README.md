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
    vagrant/
        Vagrantfile     # vagrant config for managing common dev env
    Makefile            # automate all the things
```

## Contribute

I plan to build out the material for this meet-up entirely in the public eye. The source for the web site, slidecasts, tottbox Packer build config, and tottbox Vagrantfile will live under [http://github.com/parente/tott](http://github.com/parente/tott). Starter code for session exercises and projects will reside in separate repositories prefixed with *tott-* under [http://github.com/parente](https://github.com/parente?tab=repositories).

If you have a suggestion or see a problem, [open an issue](https://github.com/parente/tott/issues). If you want to contribute an entire session, [fork and submit a pull request](https://github.com/parente/tott/fork).

## License

MIT

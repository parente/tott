# Tools of the Trade

This repository hosts the web site and related materials for a series of meet-ups about software development tools.

From the website:

> Tools of the Trade (TotT) is a recurring meet-up for students who want more practice finding, learning, applying, and evaluating tools used in modern software development. The goal is to build experience and confidence in a friendly, fun, collaborative environment. Every week we will:

## Contents

```bash
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

I plan to build out the material for our meetings entirely in the public eye. The source for the course web site, code samples, shared Vagrant box, lab exercises, and so on all live or will live under [http://github.com/parente/tott](http://github.com/parente/tott). If you have a suggestion or see a problem, [open an issue](https://github.com/parente/tott/issues) or [fork and submit a pull request](https://github.com/parente/tott/fork).

## License

MIT

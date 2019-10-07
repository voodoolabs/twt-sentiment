# RTK Golang Project Template

## Directory structure

- bin/
Here we store bash scripts, test helpers etc.

- cmd/
This directory has executable .go source files, in this folder entry point for application is located (along with main package).

- dist/
This directory is excluded from git tracking. We use it to compile binaries to (look at the Makefile)

- docs/
Detailed documentation goes here.

- pkg/
Here we store all of your code libraries.

- resources/
Here we store all the data examples, icons, graphics, database seeds etc.

- schemas/
Here we store all the document schemas for requests, responses etc.

- vendor/
We use kardianos/govendor to manage dependencies - this directory is here for that.

- Makefile
Edit/adjust this file to your liking - it is responsible for running tests, building your binaries etc.

- .gitlab-ci.yml
Edit this file to enable CI via our gitlab instance.

- .gitignore
A generic gitignore file we use for all golang projects.


### Versioning

Makefile commands support project versions. Version is extracted with command `git describe --tags` and with `LDFLAGS` that version is stored in `Version` variable.
When application is executed with `--version` flag, program should **only** print the value stored in `Version` variable. That variable should be global string variable located in main package.
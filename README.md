# Sample PSGI/nginx unit setup

This is the most basic setup you can have of a Perl PSGI app running
under nginx unit.

The `app.psgi` app just dumps the content of `%ENV` and the PSGI env
parameter.

The `unit.json` file is the configuration file we are using to start the
application.

Tip: in case you need to reload a Unit application, the current best way
to do it is to update the environment of the app, with a random value,
like this:

> curl -X PUT -d "{\"gen\":\"$RANDOM\"}"  --unix-socket /var/run/control.unit.sock http://localhost/config/applications/perl_app/environment

(note that the `perl_app` path component is the name of the application
in the `unit.json` file)

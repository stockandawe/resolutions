Resolutions
===

Ruby on Rails
---

This application requires:

- Ruby 2.2.3
- Rails 4.2.5

Getting Started
---

```
bundle
bundle exec rake db:migrate
npm install
```

Running tests
---

__Javascript__:

JS tests live in `/spec/js` and karma will run any file that ends with `_spec.js`. karma-cli is needed as a global install in order to run tests locally:

```
npm install -g karma-cli
```
karma watches for js files and runs tests whenever they change.
```
karma start
```

Single run of tests:
```
karma start --single-run
```


Deploying to Heroku
---

Heroku server must use the nodejs buildpack (+ the default ruby buildpack) in order to compile js assets using browserify (and install npm dependencies).

To add the nodejs buildpack to a heroku instance:
```
heroku buildpacks:add --index 1 heroku/nodejs
```
__npm__ dependencies must be installed in `dependencies` (not `devDependencies`) of package.json file in order to the precompilation process to pick it up.

[More on multiple buildpacks](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app)

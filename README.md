Dating-With-Node
=========
This project will aim to create a dating site written entirely in javascript - back to front. The backend will use the following technologies

  - [NodeJS](http://nodejs.org/)
  - [Express](http://expressjs.com/)
  - [Mysql](https://github.com/felixge/node-mysql)

The frontend will use the following technologies:

  - [Backbone](http://backbonejs.org/) / [Angular](http://angularjs.org/)
  - [SaSS](http://sass-lang.com/) / [Less](http://lesscss.org/)
  - [Mysql](https://github.com/felixge/node-mysql)

Dependencies
=========
  - [NodeJS](http://nodejs.org/)

_NOTE:_ Nodejs already comes with NPM

Getting Started
=========
Make sure you’re running a mysql instance if you plan on running this app locally.
Remember to edit `app/config/settings.js` to set your database, user & password.

Download the repo and get inside it


```bash
git clone https://github.com/salimkapadia/dating-with-node.git
cd dating-with-node
```


Install project dependencies

```bash
npm install
```

Run the project and reload the project when a source file changes. We use  internally.

Run the project and restart node server when changes are made to source files. This feature uses [Nodemon](https://github.com/remy/nodemon).

```bash
npm start
```


**Windows Users:** 

As usually windows has problems with detecting changes in files.

This is equivalent to `npm start` but working on Windows:

```bash
node_modules\.bin\nodemon --legacy-watch server.js
```

Or, less verbose:

```bash
npm install -g nodemon
nodemon --legacy-watch server.js
```



**NOTES:**


* With `npm start` implementation, `scripts/start` is **deprecated**
* It would be a good idea to make several configuration files for test and prod environments, see [this](http://dailyjs.com/2014/01/02/recipe-for-express-configuration/?utm_source=feedburner&utm_medium=email&utm_campaign=Feed%3A+dailyjs+%28DailyJS%29) and [this](http://www.jorisooms.be/testing-your-node-api-with-supertest/), but it is probable that Hapi framework already contemplates it.





License
=========
MIT [http://rem.mit-license.org](http://rem.mit-license.org)


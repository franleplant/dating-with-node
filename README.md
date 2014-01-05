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
  - [Npm](https://github.com/isaacs/npm/)

Dependency Installation
=========
Make sure you’re running a mysql instance if you plan on running this app locally.

```bash
git clone https://github.com/salimkapadia/dating-with-node.git
cd dating-with-node
npm install
node server.js
```

Local Development
=========
To make development easier use [Nodemon](https://github.com/remy/nodemon/). You may need to add the executable to your
bash profile. Also, edit `app/config/settings.js` to set your database, user & password.
```bash
git clone https://github.com/salimkapadia/dating-with-node.git
cd dating-with-node
npm install
./script/start
```


License
=========
MIT [http://rem.mit-license.org](http://rem.mit-license.org)


# <b>Models</b>

Models are data structures that we use to define the shape of our data. It is at the heart of JavaScript-based applications, and it is what makes it interactive.

In NodeJs server, the model you define is an abstraction of the data in your MongoDB database, which is represented as a document. Because of this abstraction, you may use the `Mongoose` schemas to construct a blueprint of how you want the added data to look and behave.

You can read this [article](https://linuxhint.com/define-models-on-nodejs-server/#:~:text=The%20model%20you%20define%20in,data%20to%20look%20and%20behave.) to see how to define models in Nodejs server:

Recall that we are working with a MERN stack which means working with MongoDB database, a NoSQL DB, so we need to create a model.

We will also use models to define the database schema. This is important so that we will be able to define the fields stored in each Mongodb document.

The Schema is a blueprint of how the database will be constructed, including other data fields that may not be required to be stored in the database. These are known as `virtual properties`.









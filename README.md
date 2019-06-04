# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Docker Command

## After cloning this repo
First command only for Linux user
```
sudo chown -R $USER:$USER .
docker-compose run web rails db:create
```

## Run the app
```
docker-compose up
```

## Stop the app
```
docker-compose down
```

## Source
[Docker.com](https://docs.docker.com/compose/rails/)


## Add by Julien
Je veux pas me prendre la tête donc français powa !

Il peut être nécessaire de lancer des commandes ``rails``

Pour ça : 
<pre>
docker-compose run web | ou | docker-compose exec web
</pre>

Une a été nécessaire à l'installation : 
<pre>
docker-compose run rails db:migrate:reset
</pre>

J'ai lancé la commande après avoir up docker, mais je pense qu'on peut le faire avant d'up docker (`docker-compose up`)

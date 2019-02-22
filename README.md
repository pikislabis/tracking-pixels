# Tracking Pixels

This is a Ruby on Rails Developer Test. The requirements are:

```
Create a Ruby on Rails App to manage tracking pixels. The app should have:
  ● User login
  ● Providers CRUD
  ● API REST to:
    ● Create new pixels for a given provider
    ● Mark the pixels as converted

Everything else is up to you

We’ll evaluate, among other things:
  ● Clean and readable code
  ● Gems used
  ● Comment code
  ● Tests
  ● User interface
  ● Time management

You have a maximum of 3 hours to do this.

To review we need you to upload your code to a Github repository. Have fun :)
```

## Info

The application has been developed using Ruby 2.6.1, Rails 5.2.2 and PostgreSQL as database.

The gems used, among others, are:
* Puma
* Devise
* Simple Form
* Bootstrap 4

For testing purpose I have used Minitest.

## Deploy

### Docker Compose
You can use Docker Compose to run the application:
```bash
$ docker-compose up --build -d
```

Once the containers are up, access to web container:
```bash
$ docker-compose exec web bash
```

 and run the next commands:
```bash
$ rake db:create
$ rake db:migrate
$ rake db:setup
```

You can access to the application visiting:

```
http://localhost:3000
```

## TODOs

* Test the API.
* A Profile view where the user can view its API Token.
* Integrate the application with a CI/CD tool such as CircleCI for test automation. 

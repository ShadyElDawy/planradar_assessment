
# Application Name

## Description

The Application Name is a web application built with Ruby on Rails version 5.2.8. It allows users to create tickets and schedules background jobs to send notifications to users at a specific date and time, based on the user's timezone. The application handles scenarios such as deleting or updating tickets while ensuring notifications are sent correctly. It also includes future extensibility for notification methods using the strategy pattern, allowing users to choose specific methods or send notifications through all available methods.

## Prerequisites
- Docker: [link to Docker installation guide](https://docs.docker.com/get-docker/)
- Docker Compose: [link to Docker Compose installation guide](https://docs.docker.com/compose/install/)

## Technologies Used

- Ruby 2.5.7
- Rails 5.2.8
- PostgreSQL
- Sidekiq
- Redis
- Docker
- Docker Compose

## Getting Started

Follow the steps below to get the application up and running on your local machine.

1. Install Docker by following the [Docker installation guide](https://docs.docker.com/get-docker/).
2. Build and Launch the Application, use Docker Compose to build the application's containers and launch the services : ```docker-compose up --build```
3.  Access the Application:
    
    Once the containers are up and running, you can access the application in your web browser:
    
    -   Users:  [http://localhost:3000/users](http://localhost:3000/users)
    -   Tickets:  [http://localhost:3000/tickets](http://localhost:3000/tickets)

## Usage
1.  Create a user account by navigating to  [http://localhost:3000/users](http://localhost:3000/users).
2.  Create tickets by navigating to  [http://localhost:3000/tickets](http://localhost:3000/tickets). Provide the necessary information, including the due date.
3.  The application will schedule a background job to send notifications to the user at the specified date and time, taking into account the user's timezone.
4.  You can update or delete tickets, and the notification jobs will be handled accordingly.
5.  To extend the notification methods, you can implement additional strategies using the strategy pattern. Update the codebase with your desired methods and specific or all methods to send notifications through.

## Running Tests

The application includes basic tests to ensure its functionality. To run the tests, execute the following command: 
```docker-compose run web bundle exec rspec```
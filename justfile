# justfile

# Build the Docker images
build:
    cd rails8-app && docker-compose build

# Start the application
dev:
    cd rails8-app && docker-compose up

# Stop the application
stop:
    cd rails8-app && docker-compose down

# Run the Rails console
console:
    cd rails8-app && docker-compose run --rm web bin/rails console

# Run database migrations
migrate:
    cd rails8-app && docker-compose run --rm web bin/rails db:migrate

# Create the database
db-create:
    cd rails8-app && docker-compose run --rm web bin/rails db:create
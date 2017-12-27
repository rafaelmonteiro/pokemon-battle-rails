# pokemon-battle-rails

> This is the Rails (Ruby) implementation to the [pokemon-battle project](https://github.com/vanderleisilva/pokemon-battle)

## Docker

To run using [Docker](https://www.docker.com/):  

`docker-compose up -d`

The API will be available at `http://localhost:3000`.

### Run test suites
```
docker-compose exec web bundle exec rspec
```

## Traditional installation

### Requirements

- Ruby 2.2+
- Rails

### Local Configuration

```
bundle install
bin/rails server
```

### Run test suites

```
bundle exec rspec
```
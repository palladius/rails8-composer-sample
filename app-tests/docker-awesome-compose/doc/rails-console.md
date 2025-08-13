# Accessing Rails Console in Docker Compose

To access the Rails console for your application running in Docker Compose, use the following command:

```bash
docker compose exec web rails console
```

This command executes `rails console` inside the `web` service container.

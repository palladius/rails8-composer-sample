# Rails Cache Troubleshooting

This document provides commands to troubleshoot Rails cache issues.

## Enabling/Disabling Caching in Development

To enable or disable caching in the development environment, run the following command:

```bash
rails dev:cache
```

When running in a Docker container, you may need to prefix the command with `docker-compose exec <service_name>`. For example:

```bash
docker-compose exec web rails dev:cache
```

## Clearing the Cache

To clear the entire Rails cache, run the following command in the Rails console:

```ruby
Rails.cache.clear
```

## Reading and Writing to the Cache

To manually read and write to the cache, you can use the following commands in the Rails console:

```ruby
# Write to the cache
Rails.cache.write("my_key", "my_value")

# Read from the cache
Rails.cache.read("my_key")
```

## Checking Cache Store

To check which cache store is being used, check the `config/environments/development.rb` and `config/environments/production.rb` files for the `config.cache_store` setting.

## `Rails.cache.increment` Issues

In some cases, `Rails.cache.increment` may not work as expected, especially with certain cache stores or configurations. It might fail silently or not increment the value correctly.

If you are experiencing issues with `Rails.cache.increment`, consider using a manual read-modify-write approach instead:

```ruby
key = "my_counter"
value = Rails.cache.read(key) || 0
new_value = value + 1
Rails.cache.write(key, new_value)
```
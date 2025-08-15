APP_VERSION = File.read(Rails.root.join('VERSION')).chomp
APP_NAME = "docker-awesome-compose"

# Both dev and prod
Rails.application.configure do
  # Cloud Run exact URL
  config.hosts << "docker-awesome-compose-794266741446.us-central1.run.app"
end

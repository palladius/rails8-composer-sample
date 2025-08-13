# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a sample Post
post1 = Post.find_or_create_by!(title: "My First Blog Post", content: "This is the content of my first blog post. It's very exciting!")

# Add comments to the first post
post1.comments.find_or_create_by!(author: "Alice", body: "Great post!")
post1.comments.find_or_create_by!(author: "Bob", body: "I learned a lot from this.")

puts "Seeded #{Post.count} posts and #{Comment.count} comments."

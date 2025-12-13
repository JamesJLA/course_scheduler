# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Course.create([
  { name: "Introduction to Computer Science", code: "CS101", credits: 3, semester: "Fall 2024" },
  { name: "Data Structures", code: "CS201", credits: 4, semester: "Spring 2025" },
  { name: "Web Development", code: "CS301", credits: 3, semester: "Fall 2024" },
  { name: "Database Systems", code: "CS302", credits: 3, semester: "Spring 2025" },
  { name: "Operating Systems", code: "CS401", credits: 4, semester: "Fall 2024" },
  { name: "Software Engineering", code: "CS402", credits: 3, semester: "Spring 2025" }
])

puts "Created #{Course.count} courses"

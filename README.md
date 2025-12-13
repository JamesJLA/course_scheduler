Course Scheduler
A simple web application for students to manage their course schedule. Built with Ruby on Rails and MySQL.
Features

User authentication (sign up, login, logout)
Add courses to your schedule
Remove courses from your schedule
Persistent storage in MySQL database
Real-time updates without page refreshes

Requirements

Ruby 3.x
Rails 8.x
MySQL
Arch Linux

Setup
Install Dependencies
bashsudo pacman -S mysql ruby base-devel git
gem install bundler rails

Setup MySQL
bashsudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo mysql -u root -p

In MySQL:
sqlCREATE USER 'rails'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'rails'@'localhost';
FLUSH PRIVILEGES;
EXIT;

Install Application
bashcd course_scheduler
bundle install
rails db:create
rails db:migrate
rails db:seed

Run
bashrails server
Visit http://localhost:3000
Database Configuration

Database: course_scheduler_development
Username: rails
Password: password
Host: localhost

Edit config/database.yml to change these settings.
Troubleshooting

Reset database:
bashrails db:drop
rails db:create
rails db:migrate
rails db:seed
Check MySQL status:
bashsudo systemctl status mysqld

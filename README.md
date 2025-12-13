# Course Scheduler

A simple web application for students to manage their course schedule. Built with Ruby on Rails and MySQL.

## Features

* User authentication (sign up, login, logout)
* Add courses to your schedule
* Remove courses from your schedule
* Persistent storage in MySQL database
* Real-time updates without page refreshes

## Requirements

* Ruby 3.x
* Rails 8.x
* MySQL
* Arch Linux

## Setup

### Install Dependencies

```bash
sudo pacman -S mysql ruby base-devel git
gem install bundler rails
```

### Setup MySQL

```bash
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
sudo systemctl enable mysqld
sudo mysql -u root -p
```

In MySQL:

```sql
CREATE USER 'rails'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'rails'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### Install Application

```bash
cd course_scheduler
bundle install
rails db:create
rails db:migrate
rails db:seed
```

### Run

```bash
rails server
```

Visit http://localhost:3000

## Database Configuration

* **Database:** course_scheduler_development
* **Username:** rails
* **Password:** password
* **Host:** localhost

Edit `config/database.yml` to change these settings.

## Troubleshooting

Reset database:

```bash
rails db:drop
rails db:create
rails db:migrate
rails db:seed
```

Check MySQL status:

```bash
sudo systemctl status mysqld
```

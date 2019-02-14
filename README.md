# [Socialite](https://social-network-on-rails.herokuapp.com/)

Open-source alternative to Facebook that any community can self-host to create a private social network where privacy is the main priority

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

This project runs on [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Rails](http://installrails.com/)

Current environment:
```
rvm -v 1.29.14
ruby -v 2.5.1p57
rails -v 5.2.1
bundler -v 1.16.1
```

### Installing

In your terminal change directory to where you want to clone this rails application.

CLI:
```
git clone https://github.com/MPalhidai/SocialRails.git
cd SocialRails
bundle install
rails db:setup
```
### Running local server:

CLI:
```
rails server
```
Open your browser at "localhost:3000".

### Running the tests

CLI:
```
rspec
```

# Future Features:

- Change name to Socialite
- Make posts also allow images (either just via a URL or, more complicated, by uploading one)
- Make nav-bar bell change colors when you have a notification and display the number of notifications
- Make the notifications page a partial and dropdown on top of the post index page
- Make the flash alerts position absolute so it doesn't push other elements down
- Add paginate to all lists (network posts / find friends / notifications)
- Make friends page a partial that sits in the bottom right column
- Add OmniAuth Facebook to production environment and turn live version on in developers Facebook.
- Add the ability to remove a friend
- Make the thumbs down and trash can images red
- Add likes and comments to notifications
- Move profile to user model and make all user data editable
- Refactor everything; especially views and SQL queries
- Remove unused files
- Write RSpec tests

## Built With

* [Devise](https://github.com/plataformatec/devise) - User management
* [Bootstrap](https://github.com/twbs/bootstrap-rubygem) - Page layout
* [FontAwesome](https://github.com/bokmann/font-awesome-rails) - Awesome icons
* [Sendgrid](https://github.com/sendgrid/sendgrid-ruby) - Email distribution
* [LetterOpener](https://github.com/ryanb/letter_opener) - User confirmation in dev.

## Authors

* [Michael Palhidai](https://github.com/MPalhidai)

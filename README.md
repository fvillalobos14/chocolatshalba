## Chocolats Halba
Proyecto Ingeniería de software

* Ruby version
	2.4.0
* Rails version
	5.1.3

## Built With

* [Devise](https://github.com/plataformatec/devise) - User authentication
* [Materialize-Sass](https://github.com/mkhairi/materialize-sass) - Front-end framework
* [Rails_Admin](https://github.com/sferik/rails_admin) - Admin page
* [Cancancan](https://github.com/CanCanCommunity/cancancan) - Restrictions for users
* [Chartjs-ROR](https://github.com/airblade/chartjs-ror) - Charts
* [Wicked_PDF](https://github.com/mileszs/wicked_pdf) - Generate PDF files

## Installation
Install gems
```
bundle install --without production
```
Setup Database
```
rails db:setup
```
Migrate database
```
rails db:migrate
```
Seed database (Optional)
```
rails db:seed
```
Create Wicked_PDF initializer
```
rails g wicked_pdf
```

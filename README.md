# RoR Course

# Files

- `schema.rb`: Contains the state of the database, existing tables, their properties, and types.
- `routes.rb`: Contains all the project routes and the controller#view the point to.

# Controllers

A controller is the way to communicate the model, the view, and the routing system
`before_action`: specifies a method that is going to be run on each of the specified actions `before_action :set_blog, only: %i[ show edit update destroy ]`

# Models

## Default Values

### Using Migrations

You can set default values directly in the database via migrations.

```ruby
class AddPostStatusToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :status, :integer, default: 0
  end
end
```

### Using Active Record after_initialize callback

The `after_initialize` callback is invoked after a model is instantiated, allowing you to set default values.

```ruby
class User < ApplicationRecord
  after_initialize :set_defaults

  def set_defaults
    self.name ||= "First Last"
  end
end
```

This same approach can be used with the `before_validation` callback, default values will be applied before the model is checked.

### Use Rails Attributes API

The Rails Attributes API allows you to define default values directly in the model.

```ruby
class User < ApplicationRecord
  attribute :name, :string, default: "First Last"
end
```

## Custom Scopes

Is best practice among Ruby on Rails users, as it allows all the model logic within the model while keeping the controller free of that model related logic. There are two ways to create a custom scope:

### Lambda Function

Within the model class you can define a custom scope using the `scope` keyword:

```ruby
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle:'Ruby on Rails') }
```

### Class Method

```ruby
def self.angular
  where(subtitle: 'Angular')
end
```

# Commands

- `rails s`: Start the server, alternative to `bin/rails serve`
- `rails c`: Open ruby console, gives access to db commands with `ActiveRecord`
- `rails:db migrate`: Apply db migrations
- `rails routes --expanded`: Shows all the available routes, the `--expanded` flag formats the results into a table
- `rails db:setup`: Creates the db, loads the schema and seeds the database from `

## Generators

- `rails g controller folder_name page1 page2 ... pageN`: Creates a folder inside the `views` containing all the specified pages. All pages are added to the routes file as `get`.

- `rails g model mode_name prop1:type1 prop2:type2 ... propN:typeN`: Creates a model and a migration with the specified props. **Migration has to be run after this command**

- `rails g scaffold app_name property:type`: A scaffold is a set of automatically generated files which forms the basic structure of a Rails project.

- `rails g resource name property:type`: A light version of the scaffold generator, it adds the migration, controller, and a view folder. All of those are empty or with the bare minimum to make it functional

- `rails g migration Migration name prop1:type1 prop2:type2 ... propN:typeN`: The migration name tells ruby what the migration is going to be about, add a column to an existing table or adding a new table:

  - `rails generate migration AddEmailToUsers email:string`: this adds the email column to the already existing users
  - `rails generate migration CreateProducts name:string description:text`: this creates the products table with a name and a description

- `rails g migration add_model1_reference_to_model2 model1:references`: generates a migration that adds a foreign key (reference) between the model1 and the model2 (adds the model1 id to the model2 schema)

## Customize a generator

Generators can be changed as pleased, to remove files from the generation process, use templates, change render engine or the test framework, use custom generators, or even use third party generators. This example sets the generators default behavior to remove the javascript, css files and set the test framework to `rspec`.

These change needs to be done inside the `config/application.rb` file

```ruby
config.generators do |g|
  g.test_framework :rspec
  g.stylesheets false
  g.javascripts false
  g.helper false
end
```

## Routes

- `resources :portfolios, except: [:show]`, resources receives a param called except to exclude an array of routes that will not be added automatically.
- `get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'`:
  - `to`: points to the controller of the route.
  - `as`: sets the route prefix, meaning that the route will be available in the view as `<prefix_name>_path`.
  - Custom route path: `get 'custom_path' to: 'resource_name#controller'`.
  - Dynamic Route: `get 'query/:dynamic_portion', to: 'resource#controller'`: All that is after a `:` will be treated as a dynamic portion of the route and is saved into the params object. There can be as many dynamic portions as we need.
  - WildCard Route: `get 'resource_name/*missing', to: 'resource_name#controller'`: Should always be last otherwise it will overlap over the other routes.

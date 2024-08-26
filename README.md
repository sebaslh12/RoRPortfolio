# RoR Course

# Files

- `schema.rb`: Contains the state of the database, existing tables, their properties, and types.

# Controllers

A controller is the way to communicate the model, the view, and the routing system
`before_action`: specifies a method that is going to be run on each of the specified actions `before_action :set_blog, only: %i[ show edit update destroy ]`

# Commands

- `rails s`: Start the server, alternative to `bin/rails serve`
- `rails c`: Open ruby console, gives access to db commands with `ActiveRecord`
- `rails:db migrate`: Apply db migrations
- `rails routes --expanded`: Shows all the available routes, the `--expanded` flag formats the results into a table

## Generators

- `rails g controller folder_name page1 page2 ... pageN`: Creates a folder inside the `views` containing all the specified pages. All pages are added to the routes file as `get`.

- `rails g model mode_name prop1:type1 prop2:type2 ... propN:typeN`: Creates a model and a migration with the specified props. **Migration has to be run after this command**

- `rails g scaffold app_name property:type`: A scaffold is a set of automatically generated files which forms the basic structure of a Rails project.

- `rails g resource name property:type`: A light version of the scaffold generator, it adds the migration, controller, and a view folder. All of those are empty or with the bare minimum to make it functional

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

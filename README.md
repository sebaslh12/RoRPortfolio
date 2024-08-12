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

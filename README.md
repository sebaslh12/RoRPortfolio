# RoR Course

# Files
- `schema.rb`: Contains the state of the database, existing tables, their properties, and types.

# Controllers

A controller is the way to communicate the model, the view, and the routing system
`before_action`: specifies a method that is going to be run on each of the specified actions `before_action :set_blog, only: %i[ show edit update destroy ]`


# Commands
- `rails s`: Start the serve, alternative to `bin/rails serve`
- `rails:db migrate`: Apply db migrations
## Generators

- `rails g`
   - `rails g scaffold app_name property:type`: A scaffold is a set of automatically generated files which forms the basic structure of a Rails project.

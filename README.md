### Welcome to EZ-Move

A simple inventory app that allows a user to create an account, login and logout of their account. They can view all other user blog posts for insight of other users moving experiences. User can contribute with their own blog posts. User can create, edit and delete inventory items, boxes and categories to help organize their move.


## Built With

* [Sinatra](http://sinatrarb.com/) - Sinatra, our web framework
* [sinatra-activerecord](https://github.com/bmizerany/sinatra-activerecord) - Object Relational Mapping
* [sqlite3](https://rubygems.org/gems/sqlite3/versions/1.3.11) - SQL DB gem
* [Corneal](https://github.com/thebrianemory/corneal) - a Sinatra app generator that creates the scafold file directory and configurations.


## Prerequisites

You will need to have Ruby installed on your machine - Linux or Mac.


## Getting Started

* Fork/Clone this repo, and then navigate to the repo directory in your terminal.
* Then, run `bundle install` to install all gem dependencies.
* Run all rake migrations with `rake db:migrate`
* Finally, start up a server using `shotgun` and navigate to the localhost:9393


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cparisi1290/ez-move
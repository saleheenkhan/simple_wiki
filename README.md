##### Spin up dev instructions:

* Install Homebrew
* Install Rbenv
* Install Ruby 2.4.2 `rbenv install 2.4.2`
* Clone the repo
* `cd` to the repo directory
* Set the local ruby version `rbenv local 2.4.2`
* Bundle install
* `brew install postgresql`
* create a database that matches the database.yml
* crete a user in postgresql and give it rights to the dev database
* Once complete run `./start.sh`
* To create an initial user run `rails db:seed`
* To manually create a user run `rails c` then `User.create(email: "Youremail", password: "your_password", password_confirmation: "your_password", full_name: "Full Name", role: "admin")`

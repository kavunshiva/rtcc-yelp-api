# Rowan Technologies Code Challenge

## Assignment
Please build a web application that provides an easy to use, sortable interface for finding restaurants based on Yelp! data.

*Minimum App Features:*

+ Use the [Yelp! Api](https://www.yelp.com/developers/documentation/v3) to retrieve data on restaurants
+ Allow users to search for restaurants by city
+ Allow sorting by price and rating
+ Display 20 restaurants at a time, with each linked to the yelp page for that restaurant
+ Any features beyond this are optional

*Notes:*

+ Feel free to use whatever frameworks or technologies you feel are best suited to this task
+ Please set up your project as a Git repo and follow normal Git practices while building it
+ Treat this as much as possible as a production oriented application
+ Your solution should include instructions for setting up and running the application, and optionally should point to a publically hosted version of the app

## Setup (API)
1. Get a client ID and secret from Yelp. Per [Yelp's authentication documentation](https://www.yelp.com/developers/documentation/v3/authentication), go to their [Create App page](https://www.yelp.com/developers/v3/manage_app) and enter the information relevant to the app (you will need [to be logged in to] a Yelp account for this).
2. Make a `POST` request to Yelp's OAuth2 callback API with your client ID and secret in order to get the access token necessary to make API calls to Yelp. This can be done, e.g. from the command line as follows (and what you're looking to get back in the response, here, is the value of the `access_token`):
`curl --data 'client_id=[YOUR_CLIENT_ID]&client_secret=[YOUR_CLIENT_SECRET]' https://api.yelp.com/oauth2/token`
3. Run `bundle install` to install dependencies in your Rails application, and then run `rake db:create && rake db:migrate` (we're creating the database to appease Rails, even though we're not persisting to it).
4. Run `bundle exec figaro install` to create a `database.yml` file in the Rails `config` directory; here you can enter/copy-paste your access token as a key-value pair, i.e. `token: YOUR_ACCESS_TOKEN`
5. Start your Rails server by running `rails s` from the command line, making note of the port on which you're hosting (typically 3000). You're now ready to hit your Rails server go-between between the Yelp Fusion API and your browser client.

## Use
1. Log in using the client ID and secret from Yelp. (In addition to logging you in to the app, this will get and locally cache the Yelp API access token necessary for making all subsequent API calls.)

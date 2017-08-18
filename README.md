# ![](/readme_images/logo.png) Stranger Deals

_**Find, join, and dine**_

> **_Stranger Deals_** _is an app designed for individuals and friends, for finding and locating your favorite restaurant deals nearby while placed in perfect group sizes with friends or completely anonymous strangers for an extraordinary dining experience._

## Live Version

Click for an app demo:
[https://stranger-deals.herokuapp.com](https://stranger-deals.herokuapp.com)

## Objectives
- To develop a platform for helping users capitalize on group dining offers
- Simple user interface for finding restaurants and manipulating groups
- Enable users to simply create groups at their desired date and time
- Google maps feature for locating restaurants easily
- Chat interface for assisting users to make arrangements

## Getting Started

### Prerequisites

This project is built with [Ruby on Rails](http://rubyonrails.org/) and [PostgreSQL](https://www.postgresql.org/) with a Model-View-Controller (MVC) architecture. Follow the official documentation for the download and install.

### How to Use

Fork and clone this repository into your own directory. Install the Gem files used in this project by entering the following code in your terminal:

``bundle install``

Run the following code in your terminal to reset the database and populate it with seed data:

``rails db:reset``


### Deployment

#### Hosting
This project was deployed with [Heroku](https://www.heroku.com), create an account and follow the instructions for your own deployment.

In Heroku, you will need to connect a Redis add-on in order to utilize **ActionCable**. Add your Redis url to _production_ in:

``/config/cable.yml``

## Built With

* Ruby on Rails
* PostgreSQL
* jQuery
* Embedded Ruby
* Devise
* Pry
* Materialize
* HTTParty
* Turbolinks
* Heroku-redis

## Application Overview
![](/readme_images/the_app.png)

##### Initial Wireframes
[Link to wireframes](https://xd.adobe.com/view/8c83ed3b-e399-454f-bc3c-95cb16ffd2f0/)
![](/readme_images/wireframes.png)

##### Process Flow
![](/readme_images/process_flow.png)

##### ERD
![](/readme_images/erd.png)

##### Model Relations
![](/readme_images/model_relations.png)

##### Nested Shallow Routing
```
resources :restaurants, shallow: true do
  resources :deals do
    resources :groups
  end
end
```

## Google Maps

One of the major selling points of our application compared to other restaurant promotion apps is the use of Google Maps. Being able to locate deals in your vicinity lets you dine cheaply on a busy schedule and you can easily meet up with the rest of the group as well! No more wandering around aimlessly trying to find affordable and delicious food. The nearest 1 for 1 deal could be less than 5 minutes away and there may be someone already waiting to claim the deal with you.

On the restaurants page, there is a map with many red markers on it. Each marker represents a place with food and tempting deals, be it a restaurant, cafe or even a supermarket. One click on the marker will show you the deal(s) available available at that place:
![](/readme_images/restaurantsmap.png)

You can also search for a restaurant by name if you want to find deal(s) by a specific restaurant:
![](/readme_images/search.png)

To use Google Maps in our rails project, we included a javascript include tag within the `<head>` tag in application.html.erb:

```<%= javascript_include_tag "https://maps.googleapis.com/maps/api/js?key={YOUR_API_KEY}&&libraries=places"  %>```

Create a div with `id="map"` in the view, and call the following function in the front end javascript:

``var map = new google.maps.Map(document.getElementById('map'), {
  center: {
    lat: 1.352083,
    lng: 103.819836 #lat & lng can be customised based on where you want the map to center at
  },
  zoom: 11
})``

The following function provided by Google Maps creates markers at a specific location on the map based on latitude and longitude:

``new google.maps.Marker({
  position: {
    lat: latitude,
    lng: longitude
  },
  map: map
})``

We plan to incorporate more Google Map features into our app in the near future, starting with Geolocation and infoWindows.

## Action Cables (Group Chat)

Action Cables allow the client to have a persistent connection to the server and communicate with the server and vice versa without reloading the page. This allows us to make real time applications, such as the group chat feature within each group:

![](/readme_images/chat.png)

A well illustrated flow chat on how Action Cables work ( from [http://www.thegreatcodeadventure.com/rails-5-action-cable-with-multiple-chatroom-subscriptions/]() ):

![](/readme_images/actioncable.png)

Using our chat feature as an example, the user is subscribed to the message channel upon connecting to the chatroom. The front end javascript is constantly listening for an event (submitting a message) and sends this message, with other information such as the chatroom id and the user who sent the message, to the message channel.
The message channel creates a message and saves it in the database, then broadcasts this message to all users currently subscribed to the channel. This message is then rendered/appended into the view (chatbox) of the users.

### Bugs and Difficulties (and Solutions?)

#### Connection.rb is not working as intended

One of the steps to run Action Cables is to ensure that users are properly authenticated, this is done with this function in connection.rb file:

```
module ApplicationCable
    class Connection < ActionCable::Connection::Base
       identified_by :current_user

       def connect
         self.current_user = find_verified_user
         logger.add_tags 'ActionCable', current_user.name
       end

   protected
     def find_verified_user
       verified_user = User.find_by(id: cookies.signed['user.id'])
       if verified_user && cookies.signed['user.expires_at'] > Time.now
         verified_user
       else
         reject_unauthorized_connection
       end
     end
    end
end
```

This also allows channels and jobs to access `current_user` like in the controllers, which is extremely useful when you want to save a message belonging to a user. I could not get the above to work, probably because devise requires some configuration to be used with Action Cable. Unable to find a solution in time, I skipped this step and fortunately Action Cables can still work.

#### Complication with Turbolinks

Initially there were problems connecting to the message channel without refreshing the page after joining or creating a group. So I added `$(document).on('turbolinks:load', function() {}` to solve this. However this led to another problem, if the user uses the back and forward buttons and navigates back to the chatroom after going elsewhere, there will be multiple connections established with the channel and hence messages received will be rendered twice. I felt that this is a small issue and it is good enough as a temporary fix to the initial problem.

#### Challenge: Deploying onto Heroku

While there were at least a few guides on using Action Cables. It was difficult to find a guide on using Action Cables with Heroku that is easy for a beginner to understand. I was not aware that using `redis` on Heroku requires an addon and some configuration to be done. This also made me more aware that there are differences between running on development environment vs production environment. Thanks to some intense googling I was able to deploy it.

##### Heroku Addon used: [Heroku-redis](https://elements.heroku.com/addons/heroku-redis)

### Other Bugs

- Restaurants Main Map intermittent load issues. Entire map doesn’t load on first trip to page. Restaurant beacons failed to load on at least one subsequent attempt.
- Empty groups are not automatically deleted
- Clicking the ‘submit’ button repeatedly on the Create Group page results in multiple groups being created.
- Group create allows dates very far into the future, and also at times when the restaurant will probably not be open. Should probably set a limit.
- Website styling is not completely responsive to different browser sizes. Buttons sometimes stack when browser size is reduced. Also doesn’t display properly with mobile devices.

## Authors

* **[Dominic Phua](https://github.com/DominikPhua)** _- responsible for keeping vests white_
* **[Ernest Tan](https://github.com/evilernie1985)** _- responsible for keeping tests right_
* **[Ng Yang Theng](https://github.com/yangtheng)** _- responsible for keeping crests bright_
* **[Shaun Loh](https://github.com/shaunloh89)** _- responsible for keeping jests light_

## Acknowledgments

###### Our wonderful GA instructional team:
- Prima Aulia Gusta
- Shimei Wong

###### and the amazingly talented **Class of WDI 11** :heart: :tada:

# Your Project Name

This is the starter code for WDI projects. Please update this README file with information specific to your project. Replace this paragraph for instance, with a short description of your project. Then update the sections below. Refer to your project specificaion for instructions on how to submit your projects.

## Getting Started

Provide instructions here about how to get your project running on our local machine. Do we just need to clone and open a certain file or do we need to install anything first.

### Prerequisites

What is needed to install and run the project, how do we install them

```
Code example
```

### How to Use

A step by step guide on how to install and use the project, for example if this is a game, how do we play it.


```
Code example
```

More steps...

```
until finished
```


## Tests

Did you write automated tests? If so, how do we run them.


```
Code example
```

## Live Version

Where is this deployed online (github pages, heroku etc), give us the link and any access details we need.

## Built With

What did you use to build it, list the technologies, plugins, gems, packages etc.

* [jQuery](http://jquery.com/) - jQuery for example is something you likely used

## Workflow

Did you write user stories, draw wireframes, use task tracking, produce ERDs? Did you use source control, with regular commits? Include links to them here.

## Authors

Did you collaborate with others on this project, list them here

* **John McClain** - *Responsible for keeping vests white* - [GithubUserName](https://github.com/GithubUserName)

## Acknowledgments

* Hat tip to anyone who's code was used, for example [this was a useful starting point for creating this template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).

## Google Maps

One of the major selling points of our application compared to other restaurant promotion apps is the use of Google Maps. Being able to locate deals in your vicinity lets you dine cheaply on a busy schedule and you can easily meet up with the rest of the group as well! No more wandering around aimlessly trying to find affordable and delicious food. The nearest 1 for 1 deal could be less than 5 minutes away and there may be someone already waiting to claim the deal with you.

On the restaurants page, there is a map with many red markers on it. Each marker represents a place with food and tempting deals, be it a restaurant, cafe or even a supermarket. One click on the marker will show you the deal(s) available available at that place:

<img src="../../Pictures/restaurantsmap.png">

You can also search for a restaurant by name if you want to find deal(s) by a specific restaurant:

<img src="../../Pictures/search.png">

To use Google Maps in our rails project, we included a javascript include tag within the `<head>` tag in application.html.erb:

``
<%= javascript_include_tag "https://maps.googleapis.com/maps/api/js?key={YOUR_API_KEY}&&libraries=places"  %>
``

Create a div with `id="map"` in the view, and call the following function in the front end javascript:

```
var map = new google.maps.Map(document.getElementById('map'), {
  center: {
    lat: 1.352083,
    lng: 103.819836 #lat & lng can be customised based on where you want the map to center at
  },
  zoom: 11
})
```

The following function provided by Google Maps creates markers at a specific location on the map based on latitude and longitude:

```
new google.maps.Marker({
  position: {
    lat: latitude,
    lng: longitude
  },
  map: map
})
```

We plan to incorporate more Google Map features into our app in the near future, starting with Geolocation and infoWindows.

## Action Cables (Group Chat)

Action Cables allow the client to have a persistent connection to the server and communicate with the server and vice versa without reloading the page. This allows us to make real time applications, such as the group chat feature within each group:

<img src="../../Pictures/chat.png">

A well illustrated flow chat on how Action Cables work ( from [http://www.thegreatcodeadventure.com/rails-5-action-cable-with-multiple-chatroom-subscriptions/]() ):

<img src="../../Pictures/actioncable.png">

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

Heroku Addon used: [Redis to go](https://elements.heroku.com/addons/redistogo)

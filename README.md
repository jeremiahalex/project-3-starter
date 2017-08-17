# ![](/readme_images/logo.png) Stranger Deals

_**Find, join, and dine**_

> **_Stranger Deals_** _is an app designed for individuals and friends, for finding and locating your favorite restaurant deals nearby while grouping into perfect group sizes with friends or completely anonymous strangers for an extraordinary dining experience._

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

```bundle install```

Run the following code in your terminal to reset the database and populate it with seed data:

```rails db:reset```


### Deployment

#### Hosting
This project was deployed with [Heroku](https://www.heroku.com), create an account and follow the instructions for your own deployment.

In Heroku, you will need to connect a Redis add-on in order to utilize **ActionCable**. Add your Redis url to _production_ in:

```/config/cable.yml```

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
* Redis

## Application Overview
![](/readme_images/the_app.png)


##### Process Flow
![](/readme_images/process_flow.png)

##### ERD
![](/readme_images/erd.png)

##### Initial Wireframes
[Link to wireframes](https://xd.adobe.com/view/8c83ed3b-e399-454f-bc3c-95cb16ffd2f0/)
![](/readme_images/wireframes.png)

## Google Maps API


## ActionCable


## Authors

* **[Dominic Phua](https://github.com/DominikPhua)**
* **[Ernest Tan](https://github.com/evilernie1985)**
* **[Ng Yang Theng](https://github.com/yangtheng)**
* **[Shaun Loh](https://github.com/shaunloh89)**

## Acknowledgments

###### Our wonderful GA instructional team:
- Prima Aulia Gusta
- Shimei Wong

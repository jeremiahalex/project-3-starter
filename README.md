# PreciousTots
![landing page](./app/assets/readme_img/landing_page.png)
Done By: [Siya](https://github.com/Siya-ng), [Hazel](https://github.com/heyzernut) and [Mingyi](https://github.com/mingyikoh) <br>


Link To Website: [Precious-tots](https://precious-tots.herokuapp.com)

---

## Design Idea
**Observed Problem:** <br>

![problem](./app/assets/readme_img/problem.png)

**Proposed Solution:** <br>

![solution](./app/assets/readme_img/solution.png)


---

## Table of Contents
1. Design Idea
1. Table of Contents
1. User Story
<!-- 1. Use Case -->
1. ERD
1. Wireframe
1. Development Log
1. Built with
1. Technical Information

---

## User Story
#### Users
![user_story](./app/assets/readme_img/user_story.png)
- can register for an account
- can login to their account
- can subscribe / unsubscribe to monthly plan
- can receive points to their account upon subscription
- can add details of their children
- can update details of their children
- can choose a new set of clothes to receive at the start of every month
  - can view outfits that match their children's size and selected style
  - can add and remove selected outfits to their shopping cart
  - can checkout their shopping cart to start the processing
- have to return previously rented outfits when they receive newly requested ones


#### Admins
- can add new admins
- can login to admin site
- can view / edit all users in database
- can view / edit all user outfit requests
- can view / edit all clothes in database
- can add new clothes into database

<!-- #### Use Case
![Image of flowchart](app/assets/readme_img/use_case.png) -->

---

## ERD
![Image of flowchart](app/assets/readme_img/ERD_nov8.png)

---

## Wireframe
![Screenshot 1](/app/assets/readme_img/homepage.png)  |  ![Screenshot 2](/app/assets/readme_img/admin_register.png)
:------------------------------------------------:|:-------------------------------------------------:
![Screenshot 3](/app/assets/readme_img/profile.png)  |  ![Screenshot 4](/app/assets/readme_img/search.png)

![wireframe](./app/assets/readme_img/wireframe.png)

---

## Development Log

**6 Nov 2017**
* Add README with user stories, use case, ERD and wireframe

**7 Nov 2017**
* Add working home page
* Add Devise: allow for user register, login and logout
* Add registration feature. Allow for registration with the necessary information recorded i.e. email and password
* Edit ERD diagram

**8 Nov 2017**
* Add models: child, size, loan_status, style, stock_status, clothes_set, cart_item and loaned_item
* Add migrate files for all models
* Add db seed for loan_status, style, stock_status
* Add controllers for children. Users are able to create child's details under their account.

**9 Nov 2017**
* Add profile page to user account
* Add edit routes for editing children's information
* Edit user_account_update routes from "/edit" to "/profile/edit"
* Edit models: added relationships between models

**10 Nov 2017**
* Add edit & delete routes for child
* Add necessary gem files
* Add browse function

**12 Nov 2017**
* Add cart function: able to add item to cart, remove and checkout cart
* Add admin function: admin able to add other admin account, admin able to see all the loaned item and edit it

**13 Nov 2017**
* Add filter clothes function: able to filter clothes by size & style
* Edit cart function: add AJAX cart function
* Fix: double creation of cart_items
* Improve CSS

**14 Nove 2017**
* Update user registration required field
* Redirect to 'add child' on user register
* Redirect to 'filter form' on child information added
* Edit default values for style/size selection
* Browse page display current user points, ajax: +/- points on add/remove cart item.

**15 Nov 2017**
* Add AJAX to in-cart quantity, add/remove button for clothes browsing
* Add Stripe payment system
* Edit user registration > add child > payment > filter form > browse page > cart > checkout > my orders route
* Improve CSS
* Push to Heroku
* Soft launch
* Edit README

---

## Built with
* Ruby on rails

* PostgreSQL

* Materialize CSS Framework

* Stripe payment

* Active Admin

* Devise

---

## Technical Information

Ruby version: <br>
*ruby 2.4.2p198*

Configuration: <br>
*$ bundle install*

Database creation: <br>
*$ rails db:migrate*

Database initialization: <br>
*$ rails db:seed*

Deployment instructions: <br>
*$ rails server*

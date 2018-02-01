# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Project 3: Localsquare

My group is developing an *online business directory and networking platform*
to help *small scale local businesses or individuals*,
to solve the problem of a lack in popularity to the general public
by creating a community to foster collaboration between small scale businesses.

**Problem Statement**

- There is a lack in popularity of small scale local businesses or individuals.
- These business owners have difficulty advertising or reaching out to the general public.

**Proposed Solution**

- Our site aims to create a community of small scale local businesses or individuals so that they are able to collaborate to come up with business strategies instead of competing among themselves or working alone.
- Our site also aims to feature products which are not commonly found which differentiates us from other e-commerce sites.
- For example, an individual specialize in making Christmas related handicraft can choose to partner with a neighbourhood cake shop selling Christmas log cakes during the Christmas festive season through the site we are building.


## Live version
https://localsquare.herokuapp.com/


## User stories

* As an owner of a small physical shop / individual renting a box space / individual selling at a flea market or push cart, I want to collaborate and partner with other sellers so that I can increase the range of products I am selling and in the process, earn a commission by featuring other sellers' products.

* As an individual selling items on a part time basis through the web, I want to be able to show case my products by partnering with businesses having a physical shop front so that more customers are able to view my products physically before buying them. I am also able to increase my sales by advertising through more channels.

* As an entrepreneur / owner of a small business, I want to be able to reach out to more customers so that more people are aware of the items which I am selling.

* As a buyer, I want to be able to have a site which features and provides information on products which are not commonly found.

* As a buyer of online goods, I want to be able to view the products I am interested in physically before buying them so that I can ensure that I am satisfied with the quality of the products. This can be done by visiting shops, rented box spaces, flea markets or push carts which will be featuring them.

* As a buyer of online goods, I want to be able to access the catalogues and be updated of the items sold at small physical shops, rented box spaces, flea markets or push carts so that I can make the decision first before visiting them.


## Flowchart
![](/app/assets/readme/Flowchart.jpg)


## Use cases
![](/app/assets/readme/Use-Cases.jpg)


1. As a **Normal User** of our website without any registered account, this user will be able to search for businesses listed on our site and write a review anonymously.
2. After registering for any account, all **Users** have access to their personal profile page and are able to bookmark businesses. They are able to chat or message business owners.
3. As a **Registered User**, this user will be able to create business listing to advertise his / her business. This is subjected to approval by the **Administrator**.
4. Upon approval, this **Registered User** changes to a **Business Owner**. His / her business will be listed on the site and will be visible to the public. This **Business Onwer** is allowed to edit his / her business information subsequently.
5. As an **Administrator**, he / she has the access rights to approve or reject newly created business listings submitted by **Registered User**.


## Wireframes

### Home page
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-01.jpg" width="600">

### Search result page
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-02.jpg" width="600">

### Listing page
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-03.jpg" width="600">

### Sign up page
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-04.jpg" width="600">

### Sign up next for business owner
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-05.jpg" width="600">

### Log in
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-06.jpg" width="600">

### Profile for user
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-07.jpg" width="600">

### Profile for business owner - About
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-08.jpg" width="600">

### Profile for business owner - Website
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-09.jpg" width="600">

### Profile for business owner - Photo
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-10.jpg" width="600">

### Profile for business owner - Product
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-11.jpg" width="600">

### Profile for web master
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-12.jpg" width="600">

### Messenger
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-13.jpg" width="600">

### Messenger - Conversation
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-14.jpg" width="600">

### Messenger - New message
<img src="/app/assets/readme/Wireframe-P3/Wireframe-P3-15.jpg" width="600">


### ERD

![](/app/assets/readme/ERD.jpg)


### Additional features to highlight

**Image upload using Carrierwave and Cloudinary**

Carrierwave gem is used for image upload. More details can be found in this [guide](https://code.tutsplus.com/articles/uploading-with-rails-and-carrierwave--cms-28409).

Cloudinary is needed for online deployment and for retention of images uploaded.


**Action cable for instant messaging**

Messaging models have to be set up first to store the conversations and messages occurring. This [guide](https://www.sitepoint.com/build-a-messaging-system-with-rails-and-actioncable/) is used.

Action cable is then used to enable real time messaging. This [guide](https://www.sitepoint.com/rails-and-actioncable-adding-advanced-features/) is used.

Redis Cloud is needed for online deployment.


### How to Use

- Fork and clone this repository.
- Run `bundle install` to install dependencies.
- Run `rails server` to launch web server for local deployment.
- Start PostgreSQL server.
- To seed dummy data, run `rails db:seed`.


### Deployment

This project is deployed on [Heroku](https://id.heroku.com/login).
- Redis Cloud is needed for real time messaging system.
- Run `heroku addons:create rediscloud` to initialize this.


## Built With

- Ruby on Rails
- PostgreSQL
- Embedded Ruby
- [jQuery](http://jquery.com/)
- [Materialize](http://materializecss.com/)
- Devise
- Will_paginate
- Carrierwave & Cloudinary
- Action cable & Redis Cloud


## Workflow

- **Gantt chart**
<img src="/app/assets/readme/Gantt-Chart.png">

- [Kanban board](https://github.com/chongct/project-3/projects/1) used for individual tasks tracking and to record issues to attend to.


## Areas to Improve On

- Search and filter function
- Devise customization
- Functions to have more efficient collaboration between business owners


## Authors

- **Edmund Teo** - [edmundtck](https://github.com/edmundtck)
- **Chong Ching Tong** - [chongct](https://github.com/chongct)


## Acknowledgments

- Prima Aulia Gusta
- Shaun Loh

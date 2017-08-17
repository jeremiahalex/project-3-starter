# README

We have created an app to give people a whole new flexibility when it comes to event planning.

---

## Development

### ERD
The model relationship design was a unique learning experience for us. The models we used were:
- users
- events
- items
We were using PostgreSQL for the first time, and had to utilize join tables to represent many to many relationships between our models.
Items and events have a many to many relationship in this project.
![](/app/assets/images/ERD.png)

### Flowchart
Initial flowchart at the start of the project.
![](/app/assets/images/early_flow.png)
Finalized flowchart of our website.
![](/app/assets/images/final_flow.png)

### Wireframe
The design from which our website is based off of can be viewed in the [linked powerpoint](https://docs.google.com/presentation/d/1ml9hg4V50Hcqb_tYOU9-8_3El5K8Qn-v4llbk1H_qno/edit#slide=id.p)

### Routing & CRUD
#### Events had 4 main views
* Index is for displaying all events linked to users
* Show is for displaying details linked to specific event including items and chart
* New renders a form for that links to events model
* Edit renders a form for that allows updates to specific event

![alt text](app/assets/images/eventMVC.png?raw=true 'start')

#### Item had a single view that displayed
* search bar
* results from scraping
* add buttons that are linked to event setup by user

![alt text](app/assets/images/ItemMVC.png?raw=true 'start')


### Authentication
Ruby makes authentication much easier! With devise, and Ruby on Rails' autogenerated routes, the whole process was pretty automatic. We utilized devise's other routes as well to allow users to edit their password.
![](/app/assets/images/edit_user.png)

### Web Scraping

- We used a webscraping Ruby gem, __Nokogiri__ ([documentation](https://github.com/sparklemotion/nokogiri)), to access search results from http://www.fairprice.com.sg/
- Note: Nokogiri itself requires the Ruby gem __open-uri__ to fetch HTML pages

* This is the HTML page we want to scrape:
![](/app/assets/images/ntuc_search_results.png)

* We fetch the HTML document, then parse it and save the information into an array variable.
![](/app/assets/images/nokogiri.png)

* Finally, we pass this variable to our view template.
![](/app/assets/images/nokogiri_view.png)

### Chat Support ([Intercom.io](intercom.io))
- Intercom.io provides solutions for _chat support, email marketing, and other tools_ that help companies connect with customers through the customer lifecycle.

* We chose to incorporate the chat support function. This is what the user sees:
![](/app/assets/images/intercom_customer.png)

* This is how we interact with the user on the Intercom webapp:
![](/app/assets/images/intercom_agent.png)

* Set up is beautifully easy:

```javascript
<script>
  var APP_ID = "APP_ID";

 window.intercomSettings = {
    app_id: APP_ID
  };
</script>
<script>(function(){var w=window;var ic=w.Intercom;if(typeof ic==="function"){ic('reattach_activator');ic('update',intercomSettings);}else{var d=document;var i=function(){i.c(arguments)};i.q=[];i.c=function(args){i.q.push(args)};w.Intercom=i;function l(){var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://widget.intercom.io/widget/APP_ID';var x=d.getElementsByTagName('script')[0];x.parentNode.insertBefore(s,x);}if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})()</script>
```

---

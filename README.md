# README

SOME INTRO TEXT

---

## Development

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

#### Web Scraping
- We used a webscraping Ruby gem, __Nokogiri__ ([documentation](https://github.com/sparklemotion/nokogiri)), to access search results from http://www.fairprice.com.sg/
- Note: Nokogiri itself requires the Ruby gem __open-uri__ to fetch HTML pages

* This is the HTML page we want to scrape:
![](/app/assets/images/ntuc_search_results.png)

* We fetch the HTML document, then parse it and save the information into an array variable.
![](/app/assets/images/nokogiri.png)

* Finally, we pass this variable to our view template.
![](/app/assets/images/nokogiri_view.png)

#### Chat Support ([Intercom.io](intercom.io))
- Intercom.io provides solutions for _chat support, email marketing, and other tools_ that help companies connect with customers through the customer lifecycle.

* We chose to incorporate the chat support function. This is what the user sees:
![](/app/assets/images/intercom_customer.png)

* This is how we interact with the user on the Intercom webapp:
![](/app/assets/images/intercom_agent.png)

* Set up is beautifully easy:
![](/app/assets/images/intercom_setup.png)

---

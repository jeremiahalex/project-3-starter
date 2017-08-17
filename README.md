# README

We have created an app to give people a whole new flexibility when it comes to event planning.

---

## Development

### Wireframe
The design from which our website is based off of can be viewed in the [linked powerpoint](https://docs.google.com/presentation/d/1ml9hg4V50Hcqb_tYOU9-8_3El5K8Qn-v4llbk1H_qno/edit#slide=id.p)

### ERD
The model relationship design was a unique learning experience for us. The models we used were:
- users
- events
- items
We were using PostgreSQL for the first time, and had to utilize join tables to represent many to many relationships between our models.
* Items and events have a many to many relationship in this project.
![](/app/assets/images/ERD.png)

### Flowchart
Initial flowchart at the start of the project
![](/app/assets/early_flow.png)
Finalized flowchart of our website
![](/app/assets/final_flow.png)

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
![](/app/assets/images/intercom_setup.png)

---

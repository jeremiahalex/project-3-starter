
## Development

#### Web Scraping
* We used a webscraping Ruby gem, __Nokogiri__ ([documentation]((https://github.com/sparklemotion/nokogiri))), to access search results from http://www.fairprice.com.sg/
* Note: Nokogiri itself requires the Ruby gem _open-uri_ to fetch HTML pages
<br>
This is the HTML page we want to scrape:
__[NOT SURE WHERE TO INSERT THE IMAGE. CURRENTLY IN APP/ASSETS/IMAGES. SHOULD IT BE IN /PUBLIC?]__
![](/images/ntuc_search_results.png)
<br>
We fetch the HTML document, then parse it and save the information into an array variable.
![](/images/nokogiri.png)
<br>
Finally, we pass this variable to our view template.
![](/images/nokogiri_view.png)
<br>

#### Chat Support ([Intercom.io](intercom.io))
Intercom.io provides solutions for _chat support, email marketing, and other tools_ that help companies connect with customers through the customer lifecycle.
<br>
We chose to incorporate the chat support function. This is what the user sees:
![](public/img/intercom_customer.png)
<br>
This is how we interact with the user on the Intercom webapp:
![](public/img/intercom_agent.png)
<br>
Set up is beautifully easy:
![](public/img/intercom_setup.png)
<br>

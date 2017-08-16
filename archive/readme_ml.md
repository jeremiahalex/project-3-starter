## Development

#### Web Scraping
How the app works
(aka: how _packages_ and other concepts work together e.g. _MVC, deployment, database client_)
<br>
![](public/img/newsapi.png)
<br>

* Sign Up fails if: email address is taken, password is < 8 characters (works in combination with Model validators)
* __Packages: passport, passport-local, bcrypt__
* Based on [this repo](https://github.com/primaulia/passport-ref)

---

XING Ruby/Rails API Sample App
================================
Getting started:
* Create new xing app [new xing app](https://dev.xing.com) 
* replace the "#####" in **devise.rb** and **xing.rb** with the **Consumer Key** and **Consumer Secret** in your app page.
```bash
bundle install
```
```bash
rake db:migrate
```
Usage:
* Sign in with xing account (OAUTH)
* View minimal Info using of your xing profile
* Display minimal list of xing contacts (Name, Image and Organization)
TODO:
* Add linkedin to xing profile import feature.
Notes:
* heroku friendly app is available in the heroku branch 
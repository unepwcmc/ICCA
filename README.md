# ICCA Registry
This app uses the standard bundle install --path vendor/ and bundle
package procedure.

# Deployment
The app is hosted on heroku, there is a staging app at http://icca-new-stage.heroku.com/en/home and production is currently at http://iccaregistry.org/

point the icca-stage remote at:
  Fetch URL: git@heroku.com:icca-new-stage.git
  Push  URL: git@heroku.com:icca-new-stage.git

To deploy the development branch to staging:
 git push icca-stage develop:master

point the heroku branch remove at:
  Fetch URL: git@heroku.com:icca.git
  Push  URL: git@heroku.com:icca.git

To deploy the production app
 git push heroku master


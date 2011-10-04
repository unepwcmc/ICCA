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

point the heroku branch remote at:
  Fetch URL: git@heroku.com:icca.git
  Push  URL: git@heroku.com:icca.git

To deploy the production app
  git push heroku master

## Running heroku commands on specific apps
You can specify the app to run a command on with the --app option, e.g.
  heroku rake db:migrate --app icca-new-stage

# Translations
Translations are handled using tolk, which is installed as a plugin, as per the github page for tolk

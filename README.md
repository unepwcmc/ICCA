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

There are 2 ways to get the resulting translations from staging

## The easy way
Simply visit this URL substituting your the server and locale as necessary

http://icca-new-stage.heroku.com/tolk/locales/fr.yml

Then drop the resulting file into config/locales/ and commit them

## The database way
To add new translations, first deploy the app to staging as details above, then get the users to visit thestagingapp.org/tolk and put in the missing translations. 

Once the translations are complete, you need to pull the staging database down into your local machine using this command:

  heroku db:pull --app icca-new-stage

Once you've got the database, write the translations contained therin to the config/locales/*.yml files

  rake tolk:dump_all

Commit the new files and you're done with the translations, but before you go make and tea and celebrate your newly translated site, consider pulling down the newest production database again, because this is the only actual backup we have of it, pushed to git in a sqlite file...
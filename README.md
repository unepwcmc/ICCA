# ICCA Registry
This app uses the standard bundle install --path vendor/ and bundle
package procedure.

# Deployment

The app is deployed to Brightbox, for both staging and production environments (using capistrano-ext).

It has been ported to ruby 1.9.3, but because it is a Rails 2 app there is a dependency on old rubygems. If you get:

  `undefined method ``source_index' for Gem:Module (NoMethodError)`

the solution is:

  `rvm rubygems --force latest-1.8`
  
# Translations

__Please note the following infromation needs to be updated to reflect new deployment hosts__

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

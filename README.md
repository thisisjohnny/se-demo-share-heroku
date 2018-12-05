# Salesforce SE Heroku Demo Share
## Modern Software Development on Heroku
This repository contains the key code elements necessary for deploying a simple Ruby app to Heroku. The application acts as a simple web-form which posts data to a custom Salesforce Apex Web Service (NewPartnerOnboarding.apxc). In order to use this repository, you will need the following in place:
1. A [Heroku](https://www.heroku.com/) account with the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) installed
2. A [Salesforce Trailhead](https://trailhead.salesforce.com) playground org or developer edition account
3. A can-do attitude 👍

## Getting Started
On its own, this app isn't very useful. The bulk of the work comes on the Salesforce end of things, including the configuration of a custom Apex Web Service.

### Configuring Salesforce
In your Salesforce org, you will need to complete the following app and configuration changes:
1. Create a new Campaign record; you'll use the Id from this record in Step 4
2. Create a new [connected app](https://help.salesforce.com/articleView?id=connected_app_create.htm&type=5) for authentication into Salesforce
  * As the app as configured does not use OAuth authentication, you do not need to include that in your connected app options
  * After you create the app, you'll need to capture the Client Key and Secret information. These values belong in your Heroku Config Vars or, locally, your .env file
3. Create a new [Custom Metadata Type](https://help.salesforce.com/articleView?id=custommetadatatypes_metadata_api.htm&type=5) called 'Active Partner Campaign'
  * Add two new fields: Campaign Id (text, unique, case-sensitive), Is Active (checkbox)
  * Add a new MDT record with the Campaign Id from Step 1 and Is Active value of true
4. From the Developer Console, create two new classes (NewPartnerOnboarding and NewPartnerOnboardingTest) from the files in this repository

### Deploy to Heroku
I've never done this with a button before so here goes nothing!
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

#### A quick note about config vars
This application makes use of the [restforce](https://github.com/restforce/restforce) Ruby gem. After you deploy your app to Heroku, you will need to update your app's [config vars](https://devcenter.heroku.com/articles/config-vars) with the necessary information required for password authentication. Reference the restforce README for more details.
- - - -
_Made with ☕️ in Reston_

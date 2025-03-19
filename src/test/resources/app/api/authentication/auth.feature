Feature: Retrieve access token using eosApisUrl/oauth2/token
    Background:
        * def tokenUrl = eosApisUrl + '/oauth2'

    Scenario: oauth 2 flow
        Given url tokenUrl
        And path 'token'
        And form field grant_type = 'client_credentials'
        # Retrieve client id and secret from settings.xml from m2 directory
        And form field client_id = '${oauthClientId}'
        And form field client_secret = '${oauthClientSecret}'
        When method post